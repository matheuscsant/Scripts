var url = pm.environment.get("endereco");
var accessToken = pm.environment.get("tokenBearer");
var tokenExpiry = pm.environment.get("tokenExpiry");
var username = pm.environment.get("username");
var password = pm.environment.get("password");
var bascod = pm.environment.get("bascod")
var userCode = "819"

// Checks if access token is non-null or if token has expired
if (!accessToken || !tokenExpiry || new Date() > new Date(tokenExpiry)) {
    // Send POST request at endpoint auth
    pm.sendRequest({
        url: url + "/auth",
        method: "POST",
        header: {
            "Content-Type": "application/json",
            "Charset": "utf-8"
        },
        body: {
            mode: "raw",
            raw: JSON.stringify({
                usuarioCodigo: userCode,
                bascod: bascod,
                plataforma: "ANDROID",
                usuarioNome: username,
                senha: password
            })
        }
    }, function (err, res) {

        if (err === null && res.code === 200) {

            // Pegando o token e setando variaveis de ambiente e globais
            // Getting token and set enviroment variables and global variables
            pm.environment.set("tokenBearer", res.json().token);
            pm.environment.set("tokenExpiry", new Date().addHours(1));

            // Printing ok message
            console.log("Token de acesso expirado, enviando requisição para atualizar o token");
        } else {
            // Request failed
            console.error("Erro na requisição: " + (err == null ? res.code + " - " + res.json().error + " - " + res.json().message : err));
        }
    });
} else {
    // Token hasn't expired
    console.log("Token de acesso dentro da validade, nenhuma requisição enviada.");
}

// Function to add hours to the Date object
Date.prototype.addHours = function (h) {
    this.setHours(this.getHours() + h);
    return this;
}
