(window.__LOADABLE_LOADED_CHUNKS__=window.__LOADABLE_LOADED_CHUNKS__||[]).push([["ShaveLibrary"],{eh6K:function(e,t,n){n.r(t),t.default=function(e,t){var n=arguments.length>2&&void 0!==arguments[2]?arguments[2]:{};if(void 0===t||isNaN(t))throw Error("maxHeight is required");var a="string"==typeof e?document.querySelectorAll(e):e;if(a){var i=n.character||"&mldr;",r=n.classname||"js-shave",o="boolean"!=typeof n.spaces||n.spaces,s='<span class="js-shave-char">'.concat(i,"</span>");"length"in a||(a=[a]);for(var c=0;c<a.length;c+=1){var h=a[c],l=h.style,d=h.querySelector(".".concat(r)),v=void 0===h.textContent?"innerText":"textContent";d&&(h.removeChild(h.querySelector(".js-shave-char")),h[v]=h[v]);var f=h[v],g=o?f.split(" "):f;if(!(g.length<2)){var m=l.height;l.height="auto";var p=l.maxHeight;if(l.maxHeight="none",h.offsetHeight<=t)l.height=m,l.maxHeight=p;else{for(var u=g.length-1,_=0,H=void 0;_<u;)H=_+u+1>>1,h[v]=o?g.slice(0,H).join(" "):g.slice(0,H),h.insertAdjacentHTML("beforeend",s),h.offsetHeight>t?u=H-1:_=H;h[v]=o?g.slice(0,u).join(" "):g.slice(0,u),h.insertAdjacentHTML("beforeend",s);var A=o?" ".concat(g.slice(u).join(" ")):g.slice(u),L=document.createTextNode(A),j=document.createElement("span");j.classList.add(r),j.style.display="none",j.appendChild(L),h.insertAdjacentElement("beforeend",j),l.height=m,l.maxHeight=p}}}}}}}]);