USE nasa_power;

CREATE TABLE meteorology (
    Longitude FLOAT,
    Latitude FLOAT,
    Timestamp DATE,
    GWETTOP FLOAT,
    T10M_MIN FLOAT,
    V10M FLOAT,
    TS_MAX FLOAT,
    V50M FLOAT,
    V2M FLOAT,
    PBLTOP FLOAT,
    WS50M FLOAT,
    WS50M_RANGE FLOAT,
    T10M FLOAT,
    U2M FLOAT,
    WS2M_MIN FLOAT,
    TO3 FLOAT,
    TROPT FLOAT,
    TS FLOAT,
    T2M FLOAT,
    T2M_RANGE FLOAT,
    QV2M FLOAT,
    WD2M FLOAT,
    QV10M FLOAT,
    T2MDEW FLOAT,
    WS10M FLOAT,
    RHOA FLOAT,
    TS_RANGE FLOAT,
    U10M FLOAT,
    WD50M FLOAT,
    TROPPB FLOAT,
    WS2M_RANGE FLOAT,
    RH2M FLOAT,
    T2MWET FLOAT,
    U50M FLOAT,
    WS10M_MAX FLOAT,
    T10M_RANGE FLOAT,
    TS_MIN FLOAT,
    WS2M_MAX FLOAT,
    PW FLOAT,
    TQV FLOAT,
    PSH FLOAT,
    T10M_MAX FLOAT,
    T2M_MAX FLOAT,
    TROPQ FLOAT,
    WS2M FLOAT,
    WS50M_MIN FLOAT,
    T2M_MIN FLOAT,
    WD10M FLOAT,
    SLP FLOAT,
    TS_ADJ FLOAT
);

CREATE TABLE radiation (
    Longitude FLOAT,
    Latitude FLOAT,
    Timestamp DATE,
    ALLSKY_SFC_PAR_DIFF FLOAT,
    CLRSKY_KT FLOAT,
    ORIGINAL_ALLSKY_SFC_SW_DIFF FLOAT,
    MIDDAY_INSOL FLOAT,
    AOD_55 FLOAT,
    ALLSKY_SFC_SW_DWN FLOAT,
    CLRSKY_SFC_PAR_DIRH FLOAT,
    CLOUD_AMT_NIGHT FLOAT,
    CLRSKY_SFC_SW_UP FLOAT,
    CLRSKY_NKT FLOAT,
    CLRSKY_SFC_LW_UP FLOAT,
    ALLSKY_SFC_SW_UP FLOAT,
    CLRSKY_SFC_SW_DIFF FLOAT,
    ALLSKY_SFC_SW_DIFF FLOAT,
    TOA_SW_DWN FLOAT,
    ALLSKY_SFC_SW_DIRH FLOAT,
    CLRSKY_SRF_ALB FLOAT,
    ALLSKY_SRF_ALB FLOAT,
    CLOUD_AMT FLOAT,
    AOD_84 FLOAT,
    SRF_ALB_ADJ FLOAT,
    ALLSKY_SFC_PAR_DIRH FLOAT,
    ALLSKY_SFC_SW_DNI FLOAT,
    ALLSKY_SFC_PAR_TOT FLOAT,
    ALLSKY_SFC_UVA FLOAT,
    ALLSKY_SFC_LW_DWN FLOAT,
    ALLSKY_KT FLOAT,
    ORIGINAL_ALLSKY_SFC_SW_DIRH FLOAT,
    ALLSKY_SFC_LW_UP FLOAT,
    CLRSKY_SFC_PAR_TOT FLOAT,
    ALLSKY_SFC_UV_INDEX FLOAT,
    AIRMASS FLOAT,
    CLRSKY_SFC_SW_DIRH FLOAT,
    CLRSKY_SFC_SW_DNI FLOAT,
    TOA_SW_DNI FLOAT,
    CLOUD_OD FLOAT,
    CLOUD_AMT_DAY FLOAT,
    CLRSKY_SFC_LW_DWN FLOAT,
    ALLSKY_NKT FLOAT,
    CDD0 FLOAT,
    CLRSKY_SFC_PAR_DIFF FLOAT,
    CLRSKY_SFC_SW_DWN FLOAT,
    AOD_55_ADJ FLOAT
); 

CREATE TABLE location (
    Longitude FLOAT,
    Latitude FLOAT,
    State VARCHAR(50)
); 