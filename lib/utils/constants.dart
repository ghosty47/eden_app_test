const Env env = Env.kDev;

enum Env {
  kDev,
  kProd
}

const kBaseUrl = <Env, String>{
  Env.kDev: "false",
  Env.kProd: ""
};

bool kDebugMode = env == Env.kDev;
const kCurrencyNGNSymbol = "₦";

//Orders
const kOrderPlaced = 'ORDER PLACED';
const kOrderAccepted = 'ORDER ACCEPTED';
const kOrderPickUP = 'ORDER PICK UP IN PROGRESS';
const kOrderOnTransit = 'ORDER ON THE WAY TO CUSTOMER';
const kOrderArrived = 'ORDER ARRIVED';
const kOrderDelivered = 'ORDER DELIVERED';

const String kToken = "AUTH_TOKEN_EDEN#^%&#(2342423FRFRDFSr2";
const String kAccount = "ACCOUNT_EDEN#^%*^&^323DFSr2";
