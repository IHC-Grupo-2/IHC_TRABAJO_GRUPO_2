'use strict';

// Prototipo de validación: todas las personas, sectores y alertas son ficticios.
// No emplea Bluetooth, geolocalización, base de datos ni servicios de rescate.
const el = id => document.getElementById(id);
const screenNames = {
  resumen:['Resumen','Panorama de la comunidad','Información comunitaria, alertas preventivas y herramientas de respuesta.'],
  alertas:['Centro de alertas','Alertas y comunicación comunitaria','Observa los niveles de riesgo y el proceso de verificación entre vecinos.'],
  mapa:['Mapa y evacuación','Encuentra un punto seguro','Consulta las rutas de evacuación y los puntos seguros de referencia.'],
  reportar:['Reportar un riesgo','Reportes ciudadanos','Registra una incidencia en la sesión y revisa su estado.'],
  familia:['Ayuda y familia','Confirma tu estado y solicita apoyo','Consulta y actualiza los estados de tus contactos en esta sesión.'],
  brigadas:['Brigadistas','Coordinación de brigadas','Consulta estados comunitarios y organiza las solicitudes de apoyo.'],
  comercio:['Comerciantes','Protección de negocios','Ensaya el cierre preventivo y la coordinación familiar de los comerciantes.'],
  historial:['Historial','Historial local de la sesión','Consulta todas las acciones realizadas en este navegador.']
};
const levels = {
  green:['Nivel verde · Normal','Nivel verde de referencia. Identifica tus puntos seguros.','Revisa tus rutas y mantén preparado tu plan familiar.'],
  yellow:['Nivel amarillo · Advertencia','Aumento preventivo del nivel de riesgo. Mantente atento.','Consulta las rutas disponibles y organiza a tu familia.'],
  orange:['Nivel naranja · Pre-evacuación','Es momento de preparar la evacuación preventiva.','Ten a mano tus documentos y sigue las indicaciones oficiales.'],
  red:['Nivel rojo · Evacuación inmediata','Nivel rojo. Sigue las indicaciones oficiales de evacuación.','Evacúa con calma según los avisos oficiales de tu comunidad.']
};
const state = {
  page:'resumen',risk:'green',online:true,queue:[],pending:null,blocked:false,
  contacts:[{name:'Elena M.',relation:'Familiar',status:'safe'},{name:'Luis C.',relation:'Vecino',status:'safe'},
    {name:'Ana R.',relation:'Persona vulnerable',status:'sos'},{name:'Marcos P.',relation:'Vecino',status:'unknown'}],
  incidents:[{id:'I-001',type:'Persona que necesita apoyo',sector:'Sector Alto',detail:'Atención a persona vulnerable',priority:'alta',assigned:false}],
  log:[],timer:25,timerHandle:null,sequence:1
};
const stamp=()=>new Date().toLocaleTimeString('es-PE',{hour:'2-digit',minute:'2-digit'});
function write(id,text){const e=el(id);if(e)e.textContent=text;}
function record(type,text){state.log.unshift({time:stamp(),type,text});renderHistory();renderActivity();}
function notify(message){const t=el('toast');t.hidden=false;t.textContent=message;clearTimeout(notify._timer);notify._timer=setTimeout(()=>{t.hidden=true},7000);}
function showPage(id,scroll=true){if(!screenNames[id])id='resumen';state.page=id;
  document.querySelectorAll('.view').forEach(view=>{const selected=view.id==='view-'+id;view.hidden=!selected;view.classList.toggle('active',selected)});
  document.querySelectorAll('[data-page]').forEach(button=>{const selected=button.dataset.page===id;button.classList.toggle('active',selected);if(selected)button.setAttribute('aria-current','page');else button.removeAttribute('aria-current')});
  write('crumbName',screenNames[id][0]);write('viewTitle',screenNames[id][1]);write('viewDesc',screenNames[id][2]);
  if(location.hash.slice(1)!==id)history.replaceState(null,'','#'+id);
  if(scroll)window.scrollTo({top:0,behavior:'instant'});
}
function counters(){const safe=state.contacts.filter(x=>x.status==='safe').length,sos=state.contacts.filter(x=>x.status==='sos').length,missing=state.contacts.filter(x=>x.status==='unknown').length;
  write('summarySafe',safe);write('summarySos',sos);write('summaryQueue',state.queue.length);write('triageSafe',safe);write('triageSos',sos);write('triageUnknown',missing);
  write('summaryNetwork',state.online?'4 nodos':'Sin nodos');
}
function riskUpdate(level,showToast=true){if(!levels[level])return;state.risk=level;
  const [title,message,advice]=levels[level];for(const id of ['summaryBanner','riskPanel'])el(id).dataset.risk=level;
  write('summaryRisk',title);write('summaryAdvice',message);write('riskTitle',title);write('riskMessage',message);write('riskSteps',advice);write('riskTimestamp','Último cambio: '+stamp());
  document.querySelectorAll('[data-risk]').forEach(b=>{const selected=b.dataset.risk===level;b.classList.toggle('active',selected);b.setAttribute('aria-pressed',String(selected))});
  if(showToast)notify('Nivel actualizado en esta sesión: '+title+'. Consulta las alertas oficiales.');
  record('riesgo','Nivel de riesgo actualizado: '+title);
}
function netUpdate(){el('networkToggle').classList.toggle('off',!state.online);el('networkToggle').setAttribute('aria-pressed',String(state.online));
  write('networkText',state.online?'Red de referencia · 4 nodos':'Red de referencia · sin nodos');
  write('networkDetail',state.online?'Vista de referencia: 4 nodos disponibles.':'Red local desactivada: los mensajes permanecerán en cola.');
  counters();
}
function switchNetwork(){state.online=!state.online;netUpdate();record('info',state.online?'Conexión local activada en la interfaz':'Red local desactivada');
  if(state.online&&state.queue.length){let count=state.queue.length;state.queue=[];record('info','Se procesaron '+count+' mensajes pendientes en esta sesión');notify(count+' mensajes de la cola fueron procesados localmente.');}
  else notify(state.online?'Red activa en la vista local. Sin conexión Bluetooth externa.':'Red local desactivada; los nuevos mensajes quedarán en cola.');counters();}
function setMe(status){let me=state.contacts.find(c=>c.name==='Tú');
  if(!me){me={name:'Tú',relation:'Usuario actual',status};state.contacts.unshift(me);}else me.status=status;
  const msg=status==='safe'?'«Estoy a salvo» registrado en esta sesión; no se envían notificaciones.':'SOS registrado localmente; no se contactó a servicios de emergencia.';
  write('emergencyFeedback',msg);record('auxilio',msg);notify(msg);renderFamily();renderTriage();counters();
  if(status==='sos'){state.sequence++;state.incidents.unshift({id:'I-'+String(state.sequence).padStart(3,'0'),type:'Solicitud de auxilio',sector:'Quebrada Norte',detail:'Solicitud local del usuario',priority:'alta',assigned:false});renderIncidents();}
}
function sendMessage(){let msg=el('quickMessage').value;
  if(state.online){write('queueMessage','Mensaje registrado localmente; no se enviaron notificaciones.');record('info','Mensaje registrado localmente: '+msg);notify('Mensaje registrado en esta sesión.');}
  else{state.queue.push(msg);write('queueMessage','Red local desactivada; mensaje guardado en esta pestaña.');record('info','Mensaje guardado en cola local: '+msg);notify('Mensaje pendiente en la cola de esta sesión.');}counters();}
function renderFamily(){const root=el('familyList');root.replaceChildren();
  const rank={sos:0,unknown:1,safe:2};const people=[...state.contacts].sort((a,b)=>rank[a.status]-rank[b.status]);
  for(const c of people){const row=document.createElement('div');row.className='contact';
    const avatar=document.createElement('span');avatar.className='contact-avatar';avatar.textContent=c.name.split(' ').map(t=>t[0]).slice(0,2).join('').toUpperCase();
    const desc=document.createElement('div');desc.className='contact-main';const name=document.createElement('strong');name.textContent=c.name;const relation=document.createElement('small');relation.textContent=c.relation;desc.append(name,relation);
    const chip=document.createElement('span');chip.className='contact-status '+c.status;chip.textContent={safe:'A salvo',sos:'Necesita ayuda',unknown:'Sin reporte'}[c.status];row.append(avatar,desc,chip);root.append(row);}
}
function renderTriage(){const root=el('triageList');root.replaceChildren();for(const c of [...state.contacts].sort((a,b)=>({sos:0,unknown:1,safe:2}[a.status])-({sos:0,unknown:1,safe:2}[b.status]))){
  const item=document.createElement('div');item.className='triage-item';const desc=document.createElement('div');const name=document.createElement('strong');name.textContent=c.name;const small=document.createElement('small');small.textContent=c.relation;desc.append(name,small);
  const chip=document.createElement('span');chip.className='triage-pill '+c.status;chip.textContent={safe:'A salvo',sos:'Auxilio',unknown:'Sin reporte'}[c.status];item.append(desc,chip);root.append(item);}
}
function renderIncidents(){const root=el('incidentList');root.replaceChildren();const filter=el('incidentFilter').value;const items=state.incidents.filter(x=>filter==='all'||x.priority===filter);
  if(!items.length){const empty=document.createElement('p');empty.className='subtle-hint';empty.textContent='No hay incidentes de esa prioridad.';root.append(empty);return;}
  for(const i of items){const item=document.createElement('div');item.className='incident-item';const desc=document.createElement('div');const title=document.createElement('strong');title.textContent=i.type;const small=document.createElement('small');small.textContent=i.id+' · '+i.sector+(i.assigned?' · Asignado':' · Sin asignar');desc.append(title,small);const chip=document.createElement('span');chip.className='triage-pill '+(i.priority==='alta'?'high':'medium');chip.textContent=i.priority==='alta'?'Prioridad alta':'Prioridad media';item.append(desc,chip);root.append(item);}
}
function createReport(type,sector,detail){state.sequence++;const incident={id:'I-'+String(state.sequence).padStart(3,'0'),type,sector,detail,priority:type==='Persona que necesita apoyo'?'alta':'media',assigned:false};
  state.incidents.unshift(incident);state.pending=incident;
  write('pendingVerification',incident.type+' · '+incident.sector+' · pendiente de segunda confirmación');el('verifyButton').disabled=false;
  const receipt=el('reportReceipt');receipt.className='empty-receipt receipt-success';receipt.replaceChildren();const icon=document.createElement('span');icon.textContent='✓';icon.style.fontSize='28px';const p=document.createElement('p');p.textContent='Reporte '+incident.id+' registrado localmente. Pendiente de revisión en esta sesión.';receipt.append(icon,p);
  record('reporte','Reporte '+incident.id+': '+type+' · '+sector);renderIncidents();notify('Reporte registrado en esta sesión. No se difundió a personas reales.');
}
function verifyReport(){if(!state.pending)return;const incident=state.pending;state.pending=null;write('pendingVerification','Reporte '+incident.id+' confirmado por segundo contacto.');el('verifyButton').disabled=true;
  if(incident.type==='Vía bloqueada'){state.blocked=true;el('blockedPath').hidden=false;write('routeResult','Aviso: se detectó una vía bloqueada en el mapa de referencia. Consulta nuevamente una ruta alternativa.');}
  record('reporte','Segunda verificación de '+incident.id+' completada (sesión)');notify('Validación del reporte completada en esta sesión.');
}
function routePlan(){const refuge=el('refugeSelect').value;const full=refuge==='refugio';
  write('refugeName',full?'Refugio Temporal B':'Zona Alta A');write('refugeCapacity',full?'Aforo referencial completo: 20 de 20 personas':'Aforo referencial: 12 de 20 personas');
  if(full){write('routeResult','Refugio Temporal B sin aforo disponible en el mapa de referencia. Se recomienda seleccionar Zona Alta A.');el('routePath').setAttribute('stroke','#D32F2F');}
  else{write('routeResult',state.blocked?'Ruta alternativa ilustrativa: inicio → sendero norte → Zona Alta A, evitando la vía bloqueada.':'Ruta ilustrativa: inicio → cruce principal → Zona Alta A.');el('routePath').setAttribute('stroke','#0056B3');}
  record('info','Consulta de ruta de referencia hacia '+(full?'Refugio Temporal B':'Zona Alta A'));
}
function blockRoad(){state.blocked=true;el('blockedPath').hidden=false;createReport('Vía bloqueada','Quebrada Norte','Bloqueo registrado en el mapa de referencia');write('routeResult','Bloqueo registrado. Presiona «Consultar ruta» para consultar una alternativa en el mapa.');showPage('mapa',false);}
function assignIncident(){const item=state.incidents.find(x=>x.priority==='alta'&&!x.assigned)||state.incidents.find(x=>!x.assigned);if(!item){write('assignmentFeedback','No hay incidentes pendientes de asignación.');return;}
  item.assigned=true;write('assignmentFeedback',item.id+' asignado en esta sesión a una brigada.');record('info','Asignación local de brigada a '+item.id);renderIncidents();notify('La tarea quedó asignada en esta sesión.');}
function renderHistory(){const root=el('historyList');root.replaceChildren();const type=el('historyFilter').value;const list=state.log.filter(x=>type==='all'||x.type===type);if(!list.length){let item=document.createElement('li');item.textContent='Aún no hay eventos registrados.';root.append(item);return;}
  for(const v of list){const li=document.createElement('li');const time=document.createElement('time');time.textContent=v.time;const desc=document.createElement('span');desc.textContent=v.text;li.append(time,desc);root.append(li);}
}
function renderActivity(){const root=el('summaryActivity');root.replaceChildren();for(const v of state.log.slice(0,4)){const li=document.createElement('li');li.textContent=v.text;root.append(li);}}
function checkUpdate(){const done=document.querySelectorAll('.shopCheck:checked').length,total=4;el('checkBar').style.width=(done/total*100)+'%';write('checkLabel',done+' de '+total+' acciones');}
function announcement(message){write('merchantResult',message);record('info',message);notify('Acción comercial registrada en esta sesión.');}
function audioSample(){try{const AC=window.AudioContext||window.webkitAudioContext;if(!AC){notify('Tu navegador no permite reproducir audio en el navegador.');return;}const ctx=new AC();const oscillator=ctx.createOscillator(),gain=ctx.createGain();oscillator.type='sine';oscillator.frequency.setValueAtTime(state.risk==='red'?800:520,ctx.currentTime);gain.gain.setValueAtTime(.065,ctx.currentTime);gain.gain.exponentialRampToValueAtTime(.001,ctx.currentTime+.18);oscillator.connect(gain);gain.connect(ctx.destination);oscillator.start();oscillator.stop(ctx.currentTime+.2);oscillator.onended=()=>ctx.close();if(navigator.vibrate)navigator.vibrate(80);record('riesgo','Aviso sonoro reproducido localmente.');}
  catch{notify('El navegador bloqueó la reproducción del aviso.');}}
function startTimer(){if(state.timerHandle)return;if(state.timer<=0)state.timer=25;state.timerHandle=setInterval(()=>{state.timer-=1;write('countdownValue',String(Math.max(0,state.timer)).padStart(2,'0')+':00');if(state.timer<=0){clearInterval(state.timerHandle);state.timerHandle=null;record('info','Terminó el tiempo de preparación de la sesión');notify('Terminó el temporizador de preparación.');}},1000);record('info','Cuenta regresiva acelerada iniciada');}
function stopTimer(){clearInterval(state.timerHandle);state.timerHandle=null;state.timer=25;write('countdownValue','25:00');}
function setSOS(){setMe('sos');record('auxilio','Solicitud SOS registrada en esta sesión');}
function initializeSOS(){const button=el('sosButton');let pressed=false,timer=null,startAt=0;
 function begin(e){if(e?.button!==undefined&&e.button!==0)return;if(pressed)return;pressed=true;startAt=Date.now();button.classList.add('holding');
   timer=setTimeout(()=>{if(!pressed)return;pressed=false;button.classList.remove('holding');timer=null;setSOS();},1000);}
 function end(){if(!pressed)return;pressed=false;button.classList.remove('holding');clearTimeout(timer);timer=null;}
 button.addEventListener('pointerdown',begin);['pointerup','pointerleave','pointercancel','blur'].forEach(name=>button.addEventListener(name,end));
 button.addEventListener('keydown',e=>{if(e.repeat)return;if(e.key===' '||e.key==='Enter'){e.preventDefault();begin();}});
 button.addEventListener('keyup',e=>{if(e.key===' '||e.key==='Enter')end();});
 button.addEventListener('click',e=>e.preventDefault());
}

document.querySelectorAll('[data-page]').forEach(b=>b.addEventListener('click',()=>showPage(b.dataset.page)));
document.querySelectorAll('[data-go]').forEach(b=>b.addEventListener('click',()=>showPage(b.dataset.go)));
document.querySelectorAll('[data-action=safe]').forEach(b=>b.addEventListener('click',()=>setMe('safe')));
document.querySelectorAll('[data-risk]').forEach(b=>b.addEventListener('click',()=>riskUpdate(b.dataset.risk)));
el('networkToggle').addEventListener('click',switchNetwork);
el('toneBtn').addEventListener('click',audioSample);
el('verifyButton').addEventListener('click',verifyReport);
el('incidentForm').addEventListener('submit',event=>{event.preventDefault();createReport(el('incidentType').value,el('incidentSector').value,el('incidentDetails').value.trim());el('incidentDetails').value='';});
el('refugeSelect').addEventListener('change',routePlan);el('routeButton').addEventListener('click',routePlan);el('blockButton').addEventListener('click',blockRoad);
el('safeButton').addEventListener('click',()=>setMe('safe'));el('sendMessage').addEventListener('click',sendMessage);
el('incidentFilter').addEventListener('change',renderIncidents);el('assignButton').addEventListener('click',assignIncident);
el('startTimer').addEventListener('click',startTimer);el('resetTimer').addEventListener('click',stopTimer);
document.querySelectorAll('.shopCheck').forEach(b=>b.addEventListener('change',checkUpdate));
el('closeShop').addEventListener('click',()=>announcement('Aviso de cierre guardado en la sesión; no se enviaron notificaciones.'));
el('relativeHelp').addEventListener('click',()=>announcement('Solicitud de apoyo para '+el('relativeType').value.toLowerCase()+' registrada en esta sesión.'));
el('historyFilter').addEventListener('change',renderHistory);
el('resetDemo').addEventListener('click',()=>location.reload());
window.addEventListener('hashchange',()=>showPage(location.hash.slice(1),false));
initializeSOS();renderFamily();renderTriage();renderIncidents();netUpdate();record('info','Sesión iniciada · Quebrada Norte');riskUpdate('green',false);counters();showPage(location.hash.slice(1)||'resumen',false);