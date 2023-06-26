# wallet-transaction-system
This app for system transaction using Wallet

## Endpoint

### Login User
```json
POST # /api/login

{
    "username": "user2",
    "password": "password"
}
```

Response:
```json
{
    "token": "[auth_token]"
}
```

### Create Wallet
```json
POST # /api/wallets
```

Response:
```json
{
    "message": {
        "id": 1,
        "user_id": 1,
        "balance": 0,
        "created_at": "2023-06-24T07:40:21.958Z",
        "updated_at": "2023-06-24T07:40:21.958Z",
        "label": "My Wallet"
    }
}
```

### Topup Wallet
```json
POST # /api/topup

{
    "amount": 10000
}
```

Response:
```json
{
    "data": {
        "id": 11,
        "type": "Topup",
        "amount": 10000,
        "user_id": 1,
        "status": "success",
        "created_at": "2023-06-26T04:02:10.701Z",
        "updated_at": "2023-06-26T04:02:10.701Z"
    }
}
```

### Transfer Money
```json
POST # /api/transfer

{
    "amount": 1000,
    "target_user_id": 2
}
```

Response:
```json
{
    "data": {
        "id": 1,
        "type": "Transfer",
        "amount": 1000,
        "user_id": 1,
        "target_user_id": 2,
        "status": "success",
        "created_at": "2023-06-26T04:03:35.617Z",
        "updated_at": "2023-06-26T04:03:35.617Z"
    }
}
```

### Get Stock Price All
```json
GET # /api/price_all
```

Response:
```json
{
    "data": [
        {
            "symbol": "NIFTY NEXT 50",
            "identifier": "NIFTY NEXT 50",
            "open": 43406.5,
            "dayHigh": 43414.8,
            "dayLow": 42781.55,
            "lastPrice": 42833.15,
            "previousClose": 43387.15,
            "change": -554,
            "pChange": -1.28,
            "yearHigh": 45509.7,
            "yearLow": 36190.75,
            "totalTradedVolume": 205394832,
            "totalTradedValue": 82377641137.38,
            "lastUpdateTime": "23-Jun-2023 16:00:00",
            "perChange365d": 21.48,
            "perChange30d": 5.8
        },
        {
            "symbol": "PGHH",
            "identifier": "PGHHEQN",
            "open": 14090,
            "dayHigh": 14392,
            "dayLow": 13984.75,
            "lastPrice": 14231.6,
            "previousClose": 14033.1,
            "change": 198.5,
            "pChange": 1.41,
            "totalTradedVolume": 12249,
            "totalTradedValue": 174349938.69,
            "lastUpdateTime": "23-Jun-2023 15:44:57",
            "yearHigh": 15500,
            "yearLow": 13082,
            "perChange365d": 5.6,
            "perChange30d": 4.27
        },
        .
        .
        .
    ]
}
```

### Get Prices
```json
GET # /api/prices

{
    "symbols": "NIFTY 100"
}
```

Response:
```json
{
    "data": [
        {
            "symbol": "NIFTY 100",
            "identifier": "NIFTY 100",
            "open": 18698.95,
            "dayHigh": 18710.05,
            "dayLow": 18580.95,
            "lastPrice": 18595.75,
            "previousClose": 18722.7,
            "change": -126.95000000000073,
            "pChange": -0.68,
            "yearHigh": 19039.4,
            "yearLow": 15679.3,
            "totalTradedVolume": 415956951,
            "totalTradedValue": 288572383047.27,
            "lastUpdateTime": "23-Jun-2023 16:00:00",
            "perChange365d": 20.36,
            "perChange30d": 2.76
        },
        {
            "symbol": "INDUSINDBK",
            "identifier": "INDUSINDBKEQN",
            "open": 1272.7,
            "dayHigh": 1318,
            "dayLow": 1262,
            "lastPrice": 1309.4,
            "previousClose": 1272.7,
            "change": 36.7,
            "pChange": 2.88,
            "totalTradedVolume": 4636121,
            "totalTradedValue": 6014486134.509999,
            "lastUpdateTime": "23-Jun-2023 15:58:46",
            "yearHigh": 1342.9,
            "yearLow": 763.2,
            "perChange365d": 63.66,
            "perChange30d": 0.99
        },
        .
        .
        .
    ]
}
```

### Get Price
```json
GET # /api/price/NIFTY 200
```

Response:
```json
{
    "data": {
        "symbol": "NIFTY 200",
        "price": [
            {
                "symbol": "NIFTY 200",
                "identifier": "NIFTY 200",
                "open": 9900.85,
                "dayHigh": 9905.8,
                "dayLow": 9830,
                "lastPrice": 9837.45,
                "previousClose": 9912.4,
                "change": -74.94999999999891,
                "pChange": -0.76,
                "yearHigh": 9993.65,
                "yearLow": 8166.8,
                "totalTradedVolume": 940628649,
                "totalTradedValue": 391125212584,
                "lastUpdateTime": "23-Jun-2023 16:00:00",
                "perChange365d": 22.47,
                "perChange30d": 3.32
            },
            {
                "symbol": "AUROPHARMA",
                "identifier": "AUROPHARMAEQN",
                "open": 668,
                "dayHigh": 701,
                "dayLow": 665.75,
                "lastPrice": 699.8,
                "previousClose": 671.65,
                "change": 28.15,
                "pChange": 4.19,
                "totalTradedVolume": 4074717,
                "totalTradedValue": 2807154035.64,
                "lastUpdateTime": "23-Jun-2023 15:59:00",
                "yearHigh": 701,
                "yearLow": 397.2,
                "perChange365d": 29.54,
                "perChange30d": 11.29
            },
            .
            .
            .
        ]
    }
}
```

### Show Profile with Wallet
```json
GET # /api/profile
```

Response:
```json
{
    "user": {
        "id": 1,
        "name": "User 1",
        "username": "user1",
        "created_at": "2023-06-22T07:49:10.586Z",
        "updated_at": "2023-06-23T08:45:10.946Z",
        "wallet": {
            "id": 1,
            "user_id": 1,
            "balance": 10000,
            "created_at": "2023-06-22T11:04:52.524Z",
            "updated_at": "2023-06-24T07:31:02.119Z",
            "label": "My Wallet"
        }
    }
}
```

### Show Topup History
```json
GET # /api/topup/history
```

Response:
```json
{
    "data": [
        {
            "id": 1,
            "amount": 10000,
            "user_id": 1,
            "status": "success",
            "created_at": "2023-06-22T10:08:18.549Z",
            "updated_at": "2023-06-22T10:08:18.549Z"
        },
    ]
}
```

### Show Transfer History
```json
GET # /api/transfer/history
```

Response:
```json
{
    "data": [
        {
            "id": 1,
            "amount": 1000,
            "user_id": 1,
            "target_user_id": 2,
            "status": "success",
            "created_at": "2023-06-22T11:03:47.622Z",
            "updated_at": "2023-06-22T11:03:47.622Z"
        },
    ]
}
```
