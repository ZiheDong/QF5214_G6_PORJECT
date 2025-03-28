import requests
import pandas as pd
from datetime import datetime
import time

# 美国本土的经纬度范围（不包含夏威夷和阿拉斯加）
latitude_min, latitude_max = 24, 49   # 纬度范围 24°N - 49°N
longitude_min, longitude_max = -125, -66  # 经度范围 -125°W - -66°W
grid_step = 1  # 网格间隔 1°（每 1° 采样一个点）

# 时间范围
start_date = "20180101"  # 2018 年 1 月 1 日
end_date = "20241231"    # 2024 年 12 月 31 日

# NASA POWER API
api_url = "https://power.larc.nasa.gov/api/temporal/daily/point"

# 变量列表
variables = [
    "SLP", "T10M", "T10M_MAX", "T10M_MIN", "T10M_RANGE", "TO3", "TQV",
    "TROPPB", "TROPQ", "TROPT", "TSOIL1", "TSOIL2"
]

# 遍历所有变量
for variable in variables:
    print(f"📍 正在获取变量 {variable} ...")

    # 初始化列表存储该变量的所有数据
    data_records = []

    # 计算所有的纬度和经度点
    latitudes = range(latitude_min, latitude_max + 1, grid_step)
    longitudes = range(longitude_min, longitude_max + 1, grid_step)

    print(f"📍 预计请求 {len(latitudes) * len(longitudes)} 个采样点的数据")

    # 遍历整个区域（按网格划分）
    for lat in latitudes:
        for lon in longitudes:
            print(f"📍 正在获取 {lat}N, {lon}W 的 {variable} 数据 ...")

            # 构造 API 请求参数
            params = {
                "parameters": variable,
                "community": "RE",
                "longitude": lon,
                "latitude": lat,
                "start": start_date,
                "end": end_date,
                "format": "JSON"
            }

            # 发送请求
            response = requests.get(api_url, params=params)

            if response.status_code == 200:
                data = response.json()

                if "properties" in data and "parameter" in data["properties"]:
                    # 获取变量数据
                    var_data = data["properties"]["parameter"].get(variable, {})

                    # 遍历时间戳
                    for timestamp, value in var_data.items():
                        data_records.append([lat, lon, timestamp, value])

                    print(f"✅ {lat}N, {lon}W 的 {variable} 数据成功获取")
                else:
                    print(f"⚠️ {lat}N, {lon}W 的 {variable} 数据缺失")

            else:
                print(f"❌ {lat}N, {lon}W 请求失败，状态码: {response.status_code}, 错误信息: {response.text}")

            # 休息 0.5 秒，防止 API 限流
            time.sleep(0.5)

    # 转换数据为 DataFrame
    df = pd.DataFrame(data_records, columns=["Latitude", "Longitude", "Timestamp", variable])

    # 格式化时间列
    df["Timestamp"] = pd.to_datetime(df["Timestamp"], format="%Y%m%d")

    # 生成 CSV 文件名
    output_filename = f"US_{variable}_20180101_20241231_Daily.csv"
    df.to_csv(output_filename, index=False)

    print(f"✅ {variable} 数据已保存为 {output_filename}")

print("✅ 所有变量的数据获取完成！")
