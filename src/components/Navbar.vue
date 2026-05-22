<template>
    <nav class="navbar">
        <div class="navbar-item has-dropdown">
            <a @click="changeStatus" id="burger" class="navbar-burger" :class="{'is-active':isActive}">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </a>

            <div id="nav-links" class="navbar-dropdown" :class="{'show-menu':isActive}">
                <RouterLink @click="changeStatus" class="navbar-item" to="/">Home</RouterLink>
                <RouterLink @click="changeStatus" class="navbar-item" to="/calculadora/simples">Simples</RouterLink>
                <RouterLink @click="changeStatus" class="navbar-item" to="/calculadora/imc">IMC</RouterLink>
            </div>

        </div>

        <img class="nav-img" src="../assets/nome_logo3.png"/>
        
    </nav>   
</template>

<script>
export default {
    data(){
        return {
            isActive: Boolean
        }
    },
    created(){
        this.isActive = false;
    },
    methods: {
        changeStatus: function() {
            this.isActive = !this.isActive ? true : false; 
        }
    }
}
</script>

<style scoped>
nav{
    display: flex;
    align-items: center;
    height: 60px;
    /* color: #ffffff;
    background-color: #ff6a13; */
    
}

.nav-img{
    padding-left: 10px;
    height: 30px;
    margin-top: -5px;
}

.navbar {
    padding-left: 5px;
}

.navbar-burger {
    margin-inline-start: initial;
    color: #ff6a13;
}

#nav-links {
    background-color: var(--color-background);
}

a {
    color: var(--color-label) !important;
    background-color: var(--color-background) !important;
}

.navbar-burger span {
    font-size: 5em;
}

.show-menu {
    display: block !important;
}

@media screen and (max-width: 800px) {
    .nav-img{
        height: 20px;
    }
}

@media screen and (min-width: 1024px) {
    .navbar-burger {
        display: block;
    }

    .navbar-dropdown {
        border-top: 0px;
        border-top-left-radius: var(--bulma-navbar-dropdown-radius);
        border-top-right-radius: var(--bulma-navbar-dropdown-radius);
    }
}

@media screen and (max-width: 1024px) {
    
    .navbar-dropdown {
        display: none;

        border-bottom-left-radius: var(--bulma-navbar-dropdown-radius);
        border-bottom-right-radius: var(--bulma-navbar-dropdown-radius);
        border-top-left-radius: var(--bulma-navbar-dropdown-radius);
        border-top-right-radius: var(--bulma-navbar-dropdown-radius);
        background-color: var(--bulma-navbar-dropdown-background-color);
        box-shadow: 0 0.5em 0.5em hsla(var(--bulma-scheme-h),var(--bulma-scheme-s),var(--bulma-scheme-invert-l),.1);
        position: absolute;
        top: 100%;
    }
}
</style>