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

const String kToken = "AUTH_TOKEN_EDEN#^%&#(2342423FRFRDFSr2";
const String kAccount = "ACCOUNT_EDEN#^%*^&^323DFSr2";
