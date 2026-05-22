<template>
    <main>
        <div class="card">
            <div class="card-content">
                <div class="context">
                    <div class="context-title">
                        <h4 class="title is-4">Calculadora Simples</h4>
                    </div>
                    <div class=card-calc>
                        <div class="input-control">
                            <div>
                                <p class="control">
                                    <input class="input" type="text" placeholder="Valor" v-model="valor" ref="txtvalor" @keypress="desativarBotao(this.operador)"/>
                                </p>
                            </div>
                        </div>
                        <div class="button-control">
                            <button id="somar" class="button operador primary-color" @click="adicionarExpressao('+')"> + </button>
                            <button id="subtrair" class="button operador primary-color" @click="adicionarExpressao('-')"> - </button>
                            <button id="multiplicar" class="button operador primary-color" @click="adicionarExpressao('*')"> x </button>
                            <button id="dividir" class="button operador primary-color" @click="adicionarExpressao('/')"> ÷ </button>
                        </div>
                        <div class="button-control">
                            <button style="width:90px" class="button primary-color" @click="igual"> = </button>
                            <button style="width:90px" class="button primary-color" @click="limpar"> CE </button>
                        </div>
                        <div class="label-result">
                            <div class="div-result">
                                <label v-if="resultado !== 0" class="label">{{resultado}} </label>
                            </div>
                        </div>

                        <div v-if="listValores !== null" class="table-control">
                            <div class="table">
                                <table>
                                    <tbody>
                                        <div v-for="item in listValores.slice().reverse()" v-bind:key="item.valor">
                                            <tr>
                                                <td class="column-operator">
                                                    {{item.operacao}}
                                                </td>
                                                <td class="column-value">{{item.valor}}</td>
                                            </tr>
                                        </div>
                                    </tbody>
                                </table>
                                <a class="link-aboutmore" href="#saiba-mais"><u>Entenda o cálculo</u></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-content">
                <div class="content">
                    <div id="saiba-mais" class="card-text">
                        <h4>Origem da calculadora</h4>
                        <p>
                            A história da calculadora remonta a séculos atrás, quando os primeiros dispositivos foram desenvolvidos para auxiliar nas operações matemáticas. 
                            Uma das primeiras formas de calculadora foi o ábaco, utilizado há milhares de anos em diversas culturas ao redor do mundo para realizar cálculos simples.
                        </p>
                        <p>
                            No entanto, foi somente durante o século XVII que as calculadoras começaram a tomar forma mais próxima do que conhecemos hoje. 
                            Blaise Pascal, matemático, físico e filósofo francês, foi um dos pioneiros nesse campo. Em 1642, aos 19 anos de idade, ele inventou a Pascalina, 
                            uma máquina mecânica capaz de realizar operações aritméticas básicas, como adição e subtração. Sua invenção foi um marco na história das calculadoras.
                        </p>
                        <p>
                            Outro nome importante na história da calculadora é Gottfried Wilhelm Leibniz, que, em 1673, desenvolveu a máquina Stepped Reckoner, 
                            capaz de realizar as quatro operações básicas (adição, subtração, multiplicação e divisão) através de um mecanismo de engrenagens.
                        </p>
                        <h4>Função e Importância na Sociedade</h4>
                        <p>
                            A calculadora desempenha um papel crucial na sociedade moderna, sendo uma ferramenta indispensável em uma variedade de áreas. 
                            Sua função principal é simplificar e acelerar o processo de realização de cálculos matemáticos e científicos.
                        </p>
                        <p>
                            Na educação, a calculadora é uma aliada valiosa no processo de ensino e aprendizado. Ela permite aos estudantes explorar conceitos matemáticos de forma prática e visual, 
                            facilitando a compreensão e o desenvolvimento de habilidades numéricas. Além disso, a calculadora é amplamente utilizada em disciplinas científicas, 
                            como física, química e biologia, onde cálculos complexos são frequentemente necessários.
                        </p>
                        <p>
                            No campo profissional, a calculadora é uma ferramenta essencial em áreas como engenharia, arquitetura, finanças, contabilidade e muitas outras. Ela permite realizar 
                            cálculos precisos e rápidos, facilitando o planejamento, a análise e a tomada de decisões em diversos contextos profissionais.
                        </p>
                        <p>
                            Além disso, a calculadora desempenha um papel fundamental no avanço da ciência e da tecnologia. Ela é utilizada em pesquisas científicas, 
                            análises estatísticas, modelagem matemática e muitas outras aplicações que contribuem para o progresso do conhecimento humano.
                        </p>
                        <p>
                            Em resumo, a calculadora é uma inovação que revolucionou o mundo dos cálculos. Desde suas origens humildes até as formas mais avançadas e digitais de hoje, 
                            ela continua a desempenhar um papel vital na sociedade, facilitando a vida das pessoas em uma variedade de áreas. 
                            Sua importância é indiscutível e sua presença é indispensável em nossa vida cotidiana.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </main>
</template>

<script>

export default {

    setup() {
    },
    // mounted(){
	// 	let mask = IMask(this.$refs.txtvalor, { //rever o IMask
	// 		mask: Number,
    //         thousandsSeparator: '.',
    //         radix: ',',
    //         mapToRadix: ['.'],
    //         scale: 2,
    //         normalizeZeros: true,
    //         signed: false,
    //         min: 0,
	// 	});
	// },
    data(){
        return {
            valor: null,
            numero1: null,
            numero2: null,
            operador: null, 
            listValores: [],
            resultado: 0,
            // ativo: false,
            // currencyMask: '',
            // myInputModel: ''
        }
    },
    methods: {
        adicionarExpressao: function(oper) {
            
            console.log("Entrou")
            
            if(this.valor != null && this.valor != '')
            {
                console.log("Normal")
                this.numero2 = this.valor;
                
                if(this.numero1 != null  && this.numero2 != null){
                    
                    this.resultado = this.calcular(this.numero1, this.numero2, this.operador);
                    
                    this.numero1 = this.resultado;
                    this.numero2 = "";
                }
                else{

                    this.numero1 = this.numero2;
                    this.resultado = this.numero1;
                }

                this.listValores.push({valor:this.valor, operacao:this.converterOperador(oper)});

                this.operador = oper;
                this.valor = "";
                this.$refs.txtvalor.focus();
                this.ativarBotao(oper);
            }
            else if(this.resultado != null && !this.ativo)
            {
                console.log("somente operador")
                console.log(oper);
                
                var item = this.listValores.slice(-1);
                //var index = this.listValores.filter( findIndex();
                this.listValores[this.listValores.length -1].operacao = oper;
                
                this.operador = oper;
                this.valor = "";
                this.$refs.txtvalor.focus();
                this.ativarBotao(oper);
            }
        },
        calcular: function(numero1, numero2, operador) {

            const expression = numero1 + operador + numero2;
            return eval(expression);
        },
        igual: function() {

            this.resultado = this.calcular(this.numero1, this.valor, this.operador);
            this.numero1 = this.resultado;
            this.numero2 = "";

            this.listValores.push({valor:this.valor, operacao:'='});
            this.listValores.push({valor:this.resultado, operacao:''});

            this.valor = "";
            this.$refs.txtvalor.focus();
        },
        ativarBotao: function(operador) {
            
            var btnID = "";

            switch (operador) {
                case "+":
                    btnID = "somar";
                    break;
                case "-":
                    btnID = "subtrair";
                    break;
                case "*":
                    btnID = "multiplicar";
                    break;
                case "/":
                    btnID = "dividir";
                    break;
                default:
                    break;
            }

            document.getElementById(btnID).classList.toggle("secondary-color");
        },
        desativarBotao: function() {

            document.getElementById('somar').classList.remove("secondary-color");
            document.getElementById('subtrair').classList.remove("secondary-color");
            document.getElementById('multiplicar').classList.remove("secondary-color");
            document.getElementById('dividir').classList.remove("secondary-color");
        },
        converterOperador: function(operador) {

            switch (operador) {
                case "+":
                    return "+";
                case "-":
                    return "-";
                case "*":
                    return "x";
                case "/":
                    return "÷";
                default:
                    break;
            }
        },
        limpar: function() {

            this.valor = "";
            this.listValores = [];
            this.resultado = 0;
            this.operador = "";
            this.desativarBotao();
        }
    }
}
</script>

<style scoped>
.card {
    width: 50%;
    margin: 0px 15px 50px 15px;
}

main {
    display: flex;
    justify-content: center;
}

.context {
    min-height: 100vh;
    height: 100%;
}

.context-title {
    display: flex;
    justify-content: center;
    margin-bottom: 50px;
}

.card-calc {
    margin: 0px 50px;
}

.input {
    width: 190px;
    margin: 0px 10px;
    background-color: var(--color-background) !important;
    color: var(--color-text) !important;
}

.column-value {
    font-size: 14px;
    width: auto;
    padding-left: 20px;
    color: var(--color-text) !important;
}

.column-operator {
    font-size: 14px;
    padding-top: 0px;
    width: 40px;
    color: var(--color-text) !important;
}

.input:focus {
    border-color: #ff6a13;
    --bulma-input-focus-shadow-alpha: 0;
}

.label {
    margin: 0px 15px;
}

.table-control {
    display: flex;
    justify-content: center;
}

.input-control {
    display: flex;
    justify-content: center;
}

.button-control {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

button {
    font-size: 15px;
    margin: 0px 6px;
}

.operador {
    padding-top: 4px;
}

.label-result {
    display: flex;
    justify-content: center;
    margin-top: 40px;
}

.label-result .label {
    color: #ff6a13;
    font-size: 18px;
}

.div-result {
    width: 180px;
    height: 40px;
    border-radius: 20px;
    display: flex;
    justify-content: center;
}

.result-border {
    border: 2px solid #ff6a13;
}

.table {
    display: flex;
    justify-content: center;
    flex-direction: column;
    margin-top: 40px;
    background-color: var(--color-background) !important;
    color: var(--color-text) !important;
}

.link-aboutmore {
    font-size: 12px;
    margin-top: 20px;
    color: #ff6a13;
}

.primary-color {
    background-color: #ff6a13;
    color: #ffffff;
}

.secondary-color {
    background-color: #ffffff;
    color: #ff6a13;
    border: 1px solid #ff6a13;
}

.card-content {
    padding: 0px 50px 80px 50px;
}

.card-text {
    padding-top: 35px;
}

h2, h4 {
    color: var(--color-text) !important;
}

a {
    background-color: var(--color-background) !important;
}

@media screen and (max-width: 1024px) {
    .card {
        width: 70%;
    }

    .card-calc {
        margin: 0px 0px;
    }
}

@media screen and (max-width: 700px) {
    .card {
        width: 100%;
    }

    .card-calc {
        margin: 0px 0px;
    }

    .context {
        height: 200vh;
    }

    .card-content {
        padding: 0px 20px 80px 20px;
    }
}
</style>