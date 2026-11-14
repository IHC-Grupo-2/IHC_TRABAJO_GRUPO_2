'use strict';

// Menú móvil
const menuBtn = document.getElementById('menuBtn');
const nav = document.getElementById('nav');
menuBtn.addEventListener('click', () => {
  const open = nav.classList.toggle('open');
  menuBtn.setAttribute('aria-expanded', String(open));
});
nav.addEventListener('click', (e) => {
  if (e.target.closest('a')) {
    nav.classList.remove('open');
    menuBtn.setAttribute('aria-expanded', 'false');
  }
});

// Simulador de semáforo de riesgo
const LEVELS = {
  green:  { label: 'Nivel verde · Normal',              title: 'Sin riesgo en tu zona',         text: 'Mantén Bluetooth encendido para recibir avisos de tus vecinos.' },
  yellow: { label: 'Nivel amarillo · Aviso',            title: 'Lluvia intensa en cuenca alta', text: 'Revisa tu ruta de evacuación y ten lista tu mochila de emergencia.' },
  orange: { label: 'Nivel naranja · Pre-evacuación',    title: 'Prepárate para evacuar',        text: 'Reúne a tu familia y ubica el punto de encuentro más cercano.' },
  red:    { label: 'Nivel rojo · Evacuación inminente', title: 'Peligro: huaico detectado',     text: 'Evacúa ahora hacia la zona alta. Sigue la ruta indicada.' }
};
const bar = document.getElementById('riskBar');
const label = document.getElementById('riskLabel');
const title = document.getElementById('riskTitle');
const text = document.getElementById('riskText');
const statusMsg = document.getElementById('statusMsg');
const levelBtns = document.querySelectorAll('.sim-btns button');

function setLevel(level) {
  const d = LEVELS[level];
  bar.dataset.level = level;
  label.textContent = d.label;
  title.textContent = d.title;
  text.textContent = d.text;
  statusMsg.textContent = '';
  levelBtns.forEach((b) => b.setAttribute('aria-pressed', String(b.dataset.level === level)));
  if (level === 'red' && navigator.vibrate) navigator.vibrate([200, 100, 200]);
}
levelBtns.forEach((b) => b.addEventListener('click', () => setLevel(b.dataset.level)));

document.getElementById('btnSafe').addEventListener('click', () => {
  statusMsg.textContent = 'Estado: a salvo. Notificado a la red.';
  if (navigator.vibrate) navigator.vibrate(80);
});
document.getElementById('btnSos').addEventListener('click', () => {
  statusMsg.textContent = 'Auxilio emitido con tu ubicación. Mantén el teléfono encendido.';
  if (navigator.vibrate) navigator.vibrate([300, 100, 300]);
});

// Formulario de pre-registro (validación en cliente; aún no envía datos a un servidor)
const form = document.getElementById('regForm');
const formMsg = document.getElementById('formMsg');
form.addEventListener('submit', (e) => {
  e.preventDefault();
  let ok = true;
  form.querySelectorAll('[required]').forEach((f) => {
    const bad = !f.value.trim();
    f.setAttribute('aria-invalid', String(bad));
    if (bad) ok = false;
  });
  formMsg.className = 'form-msg ' + (ok ? 'ok' : 'err');
  formMsg.textContent = ok
    ? 'Listo. Te avisaremos de la próxima reunión del piloto.'
    : 'Completa todos los campos para enviar tu pre-registro.';
  if (ok) form.reset();
});
