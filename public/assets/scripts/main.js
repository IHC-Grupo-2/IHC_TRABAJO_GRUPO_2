const botonMenu = document.querySelector('.boton-menu');
const menu = document.querySelector('#menu-principal');
const dialogoInfo = document.querySelector('#dialogo-info');
const dialogoRegistro = document.querySelector('#dialogo-registro');
const formulario = document.querySelector('#formulario-registro');
const resultado = document.querySelector('#resultado-registro');
const vistaMovil = window.matchMedia('(max-width: 1240px)');
let ultimoBoton;

const vistas = {
    app: {
        titulo: 'Conoce la app de ResiliNet',
        texto: 'La aplicación está en desarrollo y todavía no tiene una descarga disponible. Puedes recorrer las pantallas que diseñamos para residentes, brigadistas y comerciantes.',
        enlace: 'https://www.figma.com/design/RCyX6w1rBZle6BDl1vobjG/PROTOTIPO-RESILINET?node-id=0-1'
    },
    mapa: {
        titulo: 'Mapa y rutas de evacuación',
        texto: 'El visor propone mostrar las zonas de riesgo, las rutas y los refugios. En este avance puedes consultar su diseño; aún no muestra información en tiempo real.',
        enlace: 'https://www.figma.com/design/A73C7JusqqelOPR779nzMy/Mockup?node-id=89-1088'
    },
    reporte: {
        titulo: 'Reportes de la comunidad',
        texto: 'Esta función permitirá informar sobre deslizamientos, vías bloqueadas y otros riesgos. Por ahora puedes ver cómo se realizará un reporte en el diseño del proyecto.',
        enlace: 'https://www.figma.com/design/A73C7JusqqelOPR779nzMy/Mockup?node-id=89-1242'
    },
    sesion: {
        titulo: 'Acceso a ResiliNet',
        texto: 'El inicio de sesión está pendiente de implementación. Puedes consultar la pantalla de acceso del proyecto o probar el prerregistro de demostración desde Inicio.',
        enlace: 'https://www.figma.com/design/A73C7JusqqelOPR779nzMy/Mockup?node-id=89-1368'
    },
    boletin: {
        titulo: 'Boletín de ejemplo',
        texto: 'El panel reproduce dos ejemplos del diseño: Pedregal en nivel amarillo y Carossio en nivel verde. Estos estados son ilustrativos, no corresponden a mediciones actuales ni son avisos de emergencia.',
        enlace: 'https://www.figma.com/design/A73C7JusqqelOPR779nzMy/Mockup?node-id=89-1165'
    }
};

function cerrarMenu() {
    menu.classList.remove('menu-abierto');
    botonMenu.setAttribute('aria-expanded', 'false');
}

function abrirDialogo(dialogo, boton) {
    ultimoBoton = vistaMovil.matches && menu.contains(boton) ? botonMenu : boton;
    cerrarMenu();
    dialogo.showModal();
}

botonMenu.addEventListener('click', () => {
    const abierto = menu.classList.toggle('menu-abierto');
    botonMenu.setAttribute('aria-expanded', String(abierto));
});

menu.querySelectorAll('a[href^="#"]').forEach(enlace => {
    enlace.addEventListener('click', cerrarMenu);
});

vistaMovil.addEventListener('change', cerrarMenu);
document.addEventListener('keydown', evento => {
    if (evento.key === 'Escape' && menu.classList.contains('menu-abierto')) {
        cerrarMenu();
        botonMenu.focus();
    }
});

document.querySelectorAll('[data-info]').forEach(boton => {
    boton.addEventListener('click', () => {
        const vista = vistas[boton.dataset.info];
        document.querySelector('#titulo-info').textContent = vista.titulo;
        document.querySelector('#texto-info').textContent = vista.texto;
        document.querySelector('#enlace-info').href = vista.enlace;
        abrirDialogo(dialogoInfo, boton);
    });
});

document.querySelectorAll('[data-registro]').forEach(boton => {
    boton.addEventListener('click', () => {
        formulario.reset();
        formulario.hidden = false;
        resultado.hidden = true;
        abrirDialogo(dialogoRegistro, boton);
    });
});

document.querySelectorAll('dialog').forEach(dialogo => {
    dialogo.querySelector('[data-cerrar]').addEventListener('click', () => dialogo.close());
    dialogo.addEventListener('close', () => ultimoBoton?.focus());
    dialogo.addEventListener('click', evento => {
        const area = dialogo.getBoundingClientRect();
        const fuera = evento.clientX < area.left || evento.clientX > area.right || evento.clientY < area.top || evento.clientY > area.bottom;
        if (evento.target === dialogo && fuera) dialogo.close();
    });
});

resultado.querySelector('[data-cerrar]').addEventListener('click', () => dialogoRegistro.close());

formulario.addEventListener('submit', evento => {
    evento.preventDefault();
    const nombre = formulario.elements.nombre.value.trim();
    document.querySelector('#mensaje-registro').textContent = `${nombre}, completaste la prueba de prerregistro. No se enviaron ni guardaron tus datos. Gracias por conocer ResiliNet.`;
    formulario.reset();
    formulario.hidden = true;
    resultado.hidden = false;
    resultado.focus();
});
