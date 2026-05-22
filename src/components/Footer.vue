
<template>
    <footer>
        <div class="div-column">
            <div class="div-row">
                <div class="img">
                    <img class="logo-img" src="../assets/icon_footer.png" alt="">
                </div>
                <div class="img">
                    <img class="logo-txt" src="../assets/nome_logo.png"/>
                </div>
            </div>
            <div class="div-copyright">
                <p class="copyright">Copyright©  2024 - Todos os direitos reservados</p>
            </div>
        </div>
        <div class="div-routes">
            <div class="routes">
                <a style="font-weight: bold;" href="mailto:kalculandoonline@gmail.com">Contato</a>
                <RouterLink style="font-weight: bold;" to="/politicas">Políticas de privacidade</RouterLink>
            </div>
        </div>
    </footer>
</template>

<style scoped>
footer {
    padding: 0px 50px;
    height: 100px;
    display: flex;
    align-items: center;
    width: 100%;
    color: #ffffff !important;
    background-color: #ff6a13;
}

.img {
    display: flex;
    align-items: center;
}

.logo-img {
    width: 30px;
}

.logo-txt {
    padding-left: 10px;
    width: 150px;
}

.copyright {
    padding-top: 5px;
    font-size: small;
}

.div-column {
    display:flex;
    flex-direction:column;
    width: 50%;
}

.div-row {
    display:flex;
    flex-direction:row;
}

.div-routes{
    display: flex;
    justify-content: flex-end;
    width: 50%;
}

.routes {
    display: flex;
    flex-direction: column;
}

a {
    color: #ffffff !important;
  }

@media only screen and (max-width: 600px) {
  footer {
    padding: 0px 20px;
  }

  .div-routes{
    padding-left: 50px;
  }

  .div-row {
    display: flex;
    justify-content: center;
  }

  .div-copyright {
    text-align: center;
  }

  .copyright {
    font-size: 10px;
  }

  .logo-img {
    width: 20px;
  }

  .logo-txt {
    padding-left: 10px;
    width: 100px;
  }

  a {
    color: #ffffff !important;
    font-size: 13px;
  }
}

</style>