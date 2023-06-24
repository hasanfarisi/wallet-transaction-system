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

### Create Wallet
```json
POST # /api/wallets

```

### Topup Wallet
```json
POST # /api/topup

{
    "amount": 10000
}
```

### Transfer Money
```json
POST # /api/transfer

{
    "amount": 1000,
    "target_user_id": 4
}
```

### Get Stock Price All
```json
GET # /api/price_all
```

### Get Prices
```json
GET # /api/prices

{
    "symbols": "NIFTY 50"
}
```

### Get Price
```json
GET # /api/price/NIFTY 100
```

### Show Profile with Wallet
```json
GET # /api/profile
```

### Show Topup History
```json
GET # /api/topup/history
```

### Show Transfer History
```json
GET # /api/transfer/history
```
