
// =============================================
// RESILINET - FUNCIONALIDADES JAVASCRIPT
// Basado en los elementos de index.html
// =============================================


// 1. MENÚ DE NAVEGACIÓN

const menuBtn = document.getElementById("menuBtn");
const nav = document.getElementById("nav");

menuBtn.addEventListener("click", () => {
    const isOpen = nav.classList.toggle("open");

    menuBtn.setAttribute("aria-expanded", isOpen);
});

// Cerrar menú al seleccionar una opción

nav.querySelectorAll("a").forEach(link => {
    link.addEventListener("click", () => {
        nav.classList.remove("open");
        menuBtn.setAttribute("aria-expanded", "false");
    });
});


// 2. ELEMENTOS DEL SIMULADOR DE ALERTAS

const riskBar = document.getElementById("riskBar");
const riskLabel = document.getElementById("riskLabel");
const riskTitle = document.getElementById("riskTitle");
const riskText = document.getElementById("riskText");
const statusMsg = document.getElementById("statusMsg");


// 3. CONFIGURACIÓN DE LOS NIVELES DE RIESGO

const riskLevels = {
    green: {
        label: "Nivel verde · Normal",
        title: "Sin riesgo en tu zona",
        text: "Mantén Bluetooth encendido para recibir avisos de tus vecinos."
    },

    yellow: {
        label: "Nivel amarillo · Advertencia",
        title: "Precaución en tu zona",
        text: "Mantente atento a los avisos comunitarios y revisa las rutas de evacuación."
    },

    orange: {
        label: "Nivel naranja · Evacuación preventiva",
        title: "Prepárate para evacuar",
        text: "Organiza a tu familia y mantente atento a las indicaciones de los brigadistas."
    },

    red: {
        label: "Nivel rojo · Evacuación inmediata",
        title: "¡Peligro! Huaico detectado",
        text: "Evacúa inmediatamente hacia una zona segura siguiendo las indicaciones oficiales."
    }
};


// 4. CAMBIAR EL NIVEL DE ALERTA

const riskButtons = document.querySelectorAll(".sim-btns button");

riskButtons.forEach(button => {

    button.addEventListener("click", () => {

        const level = button.dataset.level;
        const selectedLevel = riskLevels[level];

        if (!selectedLevel) return;

        riskBar.dataset.level = level;
        riskLabel.textContent = selectedLevel.label;
        riskTitle.textContent = selectedLevel.title;
        riskText.textContent = selectedLevel.text;

        // Actualizar botón seleccionado

        riskButtons.forEach(item => {
            item.setAttribute("aria-pressed", "false");
        });

        button.setAttribute("aria-pressed", "true");

        statusMsg.textContent = "Simulación de nivel actualizada.";
    });

});


// 5. BOTÓN ESTOY A SALVO

const btnSafe = document.getElementById("btnSafe");

btnSafe.addEventListener("click", () => {

    statusMsg.textContent =
        "Simulación: tu estado es Estoy a salvo.";

});


// 6. BOTÓN AUXILIO

const btnSos = document.getElementById("btnSos");

btnSos.addEventListener("click", () => {

    statusMsg.textContent =
        "Simulación: solicitud de auxilio activada.";

});


// 7. FORMULARIO DE PRE-REGISTRO

const regForm = document.getElementById("regForm");
const formMsg = document.getElementById("formMsg");

regForm.addEventListener("submit", (event) => {

    event.preventDefault();

    const nombre = document.getElementById("nombre").value.trim();
    const contacto = document.getElementById("correo").value.trim();
    const rol = document.getElementById("rol").value;

    // Validar campos obligatorios

    if (!nombre || !contacto || !rol) {

        formMsg.textContent = "Completa todos los campos obligatorios.";
        return;

    }

    // Validar correo electrónico o celular

    const emailValido =
        /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(contacto);

    const celularValido =
        /^\+?[\d\s()-]{7,15}$/.test(contacto);

    if (!emailValido && !celularValido) {

        formMsg.textContent =
            "Ingresa un correo válido o un número de celular válido.";

        return;

    }

    // Confirmación de demostración

    formMsg.textContent =
        "Datos validados correctamente. ¡Gracias por tu interés en ResiliNet!";

    regForm.reset();

});
