(window.__LOADABLE_LOADED_CHUNKS__=window.__LOADABLE_LOADED_CHUNKS__||[]).push([["CloseupActionBarCommon"],{Hrat:function(e,t,n){var i=n("xdpg"),o=n("Ye/N");t.a=(e,t)=>{const n=e.link_domain||{},a=e.tracked_link||e.link||e.images&&e.images.orig&&e.images.orig.url,r=e.rich_metadata,s=e.domain;let l=n.official_user||e.pinner||e.origin_pinner;t&&(l=e.native_creator||l);const c=!(!(r&&r.recipe&&r.recipe.name&&r.recipe.categorized_ingredients)||r.recipe.from_aggregated_data);let d,m;r&&r.products&&r.products[0]&&(d=!!(r&&r.name&&r.offer_summary));const u=e.buyable_product,p=d||u,h=!(!r||!r.article),f=!(!r||!r.tutorial),g=!(!l||!l.username);let b=o.a._("Saved from ","Closeup pin annotation","Closeup pin annotation"),y=g?o.a._("Saved by"):o.a._("Saved from"),w=o.a._("Visit");r&&r.products&&r.products[0]&&r&&r.products[0].name&&r.products[0].offer_summary&&(b=o.a._("Product sold by ","pin annotation","pin annotation"),m=r.products[0].offer_summary),p?(y=o.a._("Sold by"),w=o.a._("Visit")):f?(b=o.a._("Saved from ","pin annotation","pin annotation"),y=g?o.a._("Saved by"):o.a._("Saved from"),w=o.a._("Visit")):c?(b=o.a._("Recipe from ","pin annotation","pin annotation"),y=g?o.a._("Recipe by"):o.a._("Recipe from"),w=o.a._("Make it")):h&&(b=o.a._("Article from ","pin annotation","pin annotation"),y=g?o.a._("Article by"):o.a._("Article from"),w=o.a._("Read it"));const E=e.rich_summary;if(!m&&E){let e;E&&E.products&&E.products[0]&&(e=!!(E&&E.products[0].name&&E.products[0].offer_summary))&&(b=o.a._("Product sold by ","pin annotation","pin annotation"))}let _,S;return g?(_="/"+l.username+"/",S=l.full_name):(_="/source/"+s,S=r&&r.site_name||s),{actionButtonText:w,image:l&&(l.image_medium_url||l.image_small_url)||e.board&&e.board.image_thumbnail_url,link:_,pinLink:a,pin:e,pinCreditPrefix:b,prefixText:y,subtitle:S,title:i.c(o.a._("More from {{ subtitle }}"),{subtitle:S}),pinTitle:e.closeup_unified_title,pinDescription:e.closeup_unified_description,pinCategory:e.category}}},qlIy:function(e,t,n){n.r(t);var i=n("q1tI"),o=n.n(i),a=n("Ye/N"),r=n("vepm"),s=n("4cpq"),l=n("dtqy");var c=Object(l.a)(({handlePinEditButtonClick:e})=>o.a.createElement(s.a,{id:"closeup-pin-edit-button"},o.a.createElement(r.a,{accessibilityLabel:a.a._("Edit","edit button on pin","edit button on pin"),onClick:t=>e&&e(t),icon:"edit"}))),d=n("JW66"),m=n("ENn1"),u=n("ynlw"),p=n("Hrat"),h=n("/MKj"),f=n("E/VT"),g=n("7w6Q"),b=n("tkfL");const y=()=>g.a.increment("windows.download.blob.error"),w=(e,t,n)=>{const i=new window.Windows.Storage.Pickers.FileSavePicker;i.suggestedStartLocation=window.Windows.Storage.Pickers.PickerLocationId.picturesLibrary;const{extension:o,extensionName:r,name:s}=(e=>{const t=e.split("/"),n=t[t.length-1],i=n.split(".");if(i.length>1){const e=i.pop();return{extension:`.${e}`,extensionName:e.toUpperCase(),name:i.join()}}return{extension:".",extensionName:a.a._("Unknown","Label for file picker drop down when the file type is not known","Label for file picker drop down when the file type is not known"),name:n}})(t);i.suggestedFileName=n||s,i.fileTypeChoices.insert(r,[o]),i.pickSaveFileAsync().then(t=>{t&&(window.Windows.Storage.CachedFileManager.deferUpdates(t),t.openAsync(window.Windows.Storage.FileAccessMode.readWrite).then(t=>{const n=e.msDetachStream();window.Windows.Storage.Streams.RandomAccessStream.copyAsync(n,t).then(()=>{t.flushAsync().done(()=>{n.close(),t.close(),g.a.increment("windows.download.blob.success")},y)},y)},y))})};var E=({filename:e,imgSrc:t,category:n})=>{if(!t)return null;return i.createElement(b.b,{onClick:()=>{((e,t)=>{try{const n=new XMLHttpRequest;n.open("GET",e,!0),n.responseType="blob",n.onreadystatechange=()=>{if(4===n.readyState)if(200!==n.status)g.a.increment("windows.download.blob.nodownload",.1,{status:n.status});else{const i=n.response;w(i,e,t)}},n.send(null)}catch(n){g.a.increment("windows.download.blob.xhrexception",.1,{error:n})}})(t,e)},text:a.a._("Download image","Button to download Pin image","Button to download Pin image")})},_=n("lUXN"),S=n("TiQD"),v=n("kmwA"),x=n("n6mq");function C(e){const{onDismiss:t,myPin:n}=e,[r,s]=Object(i.useState)(1),l=[{label:a.a._("Small","pinActionDropdown.GetEmbedCodeModal.small","Label on segmented controller for pin embed code, for small width"),width:236},{label:a.a._("Medium","pinActionDropdown.GetEmbedCodeModal.medium","Label on segmented controller for pin embed code, for medium width"),width:345},{label:a.a._("Large","pinActionDropdown.GetEmbedCodeModal.large","Label on segmented controller for pin embed code, for large width"),width:450},{label:a.a._("Extra Large","pinActionDropdown.GetEmbedCodeModal.extra_large","Label on segmented controller for pin embed code, for extra-large width"),width:600}];return o.a.createElement(x.u,null,o.a.createElement(S.b,{accessibilityModalLabel:a.a._("Get Embed Code","pinActionDropdown.GetEmbedCodeModal.modalLabel","Accessibility label on modal for pin embed code"),heading:a.a._("Get Embed Code","pinActionDropdown.GetEmbedCodeModal.header","Heading on modal for pin embed code"),onDismiss:t,footer:o.a.createElement(x.d,{display:"flex",direction:"row",justifyContent:"end"},o.a.createElement(x.e,{size:"sm",text:a.a._("Got it!","pinActionDropdown.GetEmbedCodeModal.dismissButton","Button to dismiss embed code modal"),onClick:t}))},o.a.createElement(x.d,{paddingX:6,paddingY:4},o.a.createElement(x.I,{items:l.map(e=>e.label),selectedItemIndex:r,onChange:({activeIndex:e})=>{s(e)}})),o.a.createElement(x.d,{paddingX:8,paddingY:6},o.a.createElement("code",null,`<iframe src="${v.a.settings.ASSETS_SITE_URL}/ext/embed.html?id=${n.id}" height="${Math.ceil(n.height*l[r].width/n.width+100)}" width="${l[r].width}" frameborder="0" scrolling="no" ></iframe>`))))}var T=n("hFNL"),R=n("LT60"),O=n("CvCA"),I=n("CONZ"),j=n("eUcp"),k=n("U4JR"),B=n("nGHF"),P=n("pLLR"),D=n("fArA"),L=n("+PUW");var M=Object(D.compose)(Object(h.connect)(L.d,e=>({deletePinMention:t=>e(Object(I.b)(t)),openLoginModal:()=>e(L.b)})),P.e)((function({bestPinImgSrc:e,bgColor:t,deletePinMention:n,embedImg:s,hideDownload:l,showEmbed:c,iconColor:d,iconSize:m,isFullAuth:u,onToggle:p,openLoginModal:h,pinCategory:g,pinDescription:y,pinId:w,pinImgSrc:S,pinTitle:v,reportPin:I,requestContext:P,showRemoveMention:D,usePortal:L}){const{showOneToast:M}=Object(B.b)(),[A,H]=Object(i.useState)(!1),[F,z]=Object(i.useState)(!1),U=Object(i.useRef)(),N=()=>{H(!1)},Y=()=>{n(w),N(),M(({onHide:e})=>o.a.createElement(O.a,{onHide:e,text:a.a._("@mention removed!","closeup.pinActionDropDown.mentionRemovalToast","Toast that tells user that they have successfully removed the @mention of them in another user's Pin description")}))},X=()=>{F||Object(k.a)(4439,{view:3,viewParameter:156}),H(!1),z(!F)},$=a.a._("More options","Accessible label for more options dropdown","Accessible label for more options dropdown");return o.a.createElement(x.d,{flex:"grow",alignItems:"center",display:"flex"},o.a.createElement(x.d,{ref:U},o.a.createElement(r.a,{accessibilityLabel:$,icon:"ellipsis",onClick:()=>{p&&p(),H(!A),(e=>{Object(k.a)(101,{element:e,component:4,view:3,viewParameter:139})})(981)}})),A&&(()=>{const t=o.a.createElement(x.d,{zIndex:j.a},o.a.createElement(x.n,{anchor:U.current,idealDirection:"down",onDismiss:N,size:"xs"},o.a.createElement(b.a,null,!l&&"undefined"!=typeof window&&"windows"!==Object(T.b)(window)&&e&&o.a.createElement(f.a,{imgSrc:e||"",filename:v||y,category:g,pinId:w},e=>o.a.createElement(b.b,{onClick:e,text:a.a._("Download image","Button to download Pin image","Button to download Pin image")})),!l&&"undefined"!=typeof window&&"windows"===Object(T.b)(window)&&(e||S)&&o.a.createElement(E,{imgSrc:e||S||"",filename:v||y,category:g}),o.a.createElement(b.b,{onClick:u?I:h,text:a.a._("Report Pin","Label for report pin action","Label for report pin action")}),D&&o.a.createElement(b.b,{onClick:Y,text:a.a._("Remove @mention","closeup.pinActionDropDown.removeMention","Button that allows user to remove their @mention in the pin's")}),c&&o.a.createElement(_.a,{name:"closeup_pin_embed_code"},({anyEnabled:e})=>e&&o.a.createElement(b.b,{onClick:X,text:a.a._("Get Pin embed code","Label for embed pin action","Label for embed pin action")})))));return L?o.a.createElement(R.a,null,o.a.createElement(x.u,null,t)):t})(),F&&o.a.createElement(C,{myPin:{id:w,height:s.height,width:s.width},onDismiss:X}))})),A=n("v/Q4"),H=n("YxyV"),F=n("7jH2");var z=e=>{var t;const n=Object(A.a)(),{pin:i,viewParameter:a}=e,{pinTitle:r,pinDescription:s,pinCategory:l}=Object(p.a)(i),c=Object(F.p)({pin:i}),{video:h}=Object(F.y)(c)||{},f=!!h;let g;i.images&&(g=i.embed&&"gif"===i.embed.type?i.embed.src:i.images["736x"]&&i.images["736x"].url);const b=!!i.story_pin_data_id,y=Object(H.d)(i),{isPromoted:w}=Object(u.a)(i),E=i.board.privacy===d.a.BoardPrivacy.SECRET,_=!w&&!E,S=n.isAuth&&(null===(t=i.user_mention_tags)||void 0===t?void 0:t.filter(e=>e.object_id===n.id).length)>0;return o.a.createElement(x.d,{"data-test-id":"pin-action-bar"},o.a.createElement(M,{embedImg:Object(H.e)(i,"736x"),showEmbed:_,bestPinImgSrc:y,bgColor:"transparent",hideDownload:f||b,iconColor:"gray",iconSize:"md",pinCategory:l,pinDescription:s,pinId:i.id,pinImgSrc:g,pinTitle:r,reportPin:Object(m.a)({pin:i,viewParameter:a,viewType:3}),showRemoveMention:S,usePortal:!1}))},U=n("c4Fo");const N=136;class Y extends o.a.Component{constructor(...e){var t,n,i;super(...e),i={paused:!1,showPulsar:!1},(n="state")in(t=this)?Object.defineProperty(t,n,{value:i,enumerable:!0,configurable:!0,writable:!0}):t[n]=i}componentDidMount(){this.mountPulsar(),this.props.onExperienceMount&&this.experience&&this.props.onExperienceMount(this.experience)}componentWillUnmount(){clearTimeout(this.timer)}mountPulsar(){if(!this.experience)return;const{display_data:e}=this.experience;e.has_pulsar&&this.setState({showPulsar:!0})}renderPulsar(){const{anchor:e}=this.props,{paused:t}=this.state;if(!e)return null;const n=e.getBoundingClientRect(),{height:i,width:a}=n,r=-(N/2+i/2),s=-(N/2-a/2);return o.a.createElement(x.d,{position:"absolute",dangerouslySetInlineStyle:{__style:{zIndex:1,marginTop:r,marginLeft:s,cursor:"pointer",pointerEvents:"none"}}},o.a.createElement(x.D,{paused:t}))}renderFlyout(e){const{anchor:t,flyoutSize:n,idealDirection:i,textOverflow:a}=this.props;return o.a.createElement(x.n,{anchor:t,color:"blue",idealDirection:i||"down",onDismiss:()=>{},shouldFocus:!1,showCaret:!0,size:n},o.a.createElement(x.d,{column:12,padding:3},o.a.createElement(x.R,{color:"white",overflow:a,weight:"bold"},e)))}render(){const{experienceIds:e,placementId:t,shouldTimeoutDismiss:n}=this.props,{showPulsar:i}=this.state;return o.a.createElement(U.a,{experienceIds:e,placementId:t,type:8},e=>{const{complete:t,dismiss:a,display_data:r}=e;return this.experience=e,r.has_pulsar||r.has_tooltip?(n&&r.disappearTime&&r.disappearTime>0&&(this.timer=setTimeout(()=>(a(),null),r.disappearTime)),o.a.createElement(x.d,{dangerouslySetInlineStyle:{__style:{zIndex:10}}},i&&this.renderPulsar(),r.has_tooltip&&(!r.has_pulsar||this.state.paused)&&this.renderFlyout(r.text))):(t(),null)})}}var X=n("1Vso");const $=20,G={loaded:{opacity:1,transitionDuration:"0.20s",transitionTimingFunction:"cubic-bezier(0, 0, 0.58, 1)",transitionProperty:"transform, opacity",transform:"translate(0, 5px)",transformOrigin:"center"},fade:{opacity:.1,transitionDuration:"0.30s",transitionTimingFunction:"cubic-bezier(0, 0, 0.58, 1)",transitionProperty:"transform, opacity",transform:"translate(0, 5px)",transformOrigin:"center"}};function W({reactionLabel:e,handleHideConfirmation:t}){const[n,a]=Object(i.useState)("loaded"),r=Object(i.useRef)();return Object(i.useEffect)(()=>{let e=null,n=null;return r.current=requestAnimationFrame(()=>{e=setTimeout(()=>a("fade"),1e3),n=setTimeout(()=>t(),1300)}),function(){clearTimeout(e),clearTimeout(n)}},[]),o.a.createElement(x.d,{position:"relative",display:"flex",alignItems:"center",justifyContent:"center"},o.a.createElement(x.d,{rounding:"pill",position:"absolute",color:"darkGray",ref:r,height:$,display:"flex",alignItems:"center",justifyContent:"center",paddingY:1,paddingX:2,dangerouslySetInlineStyle:{__style:{...G[n],whiteSpace:"nowrap"}}},o.a.createElement(x.R,{color:"white",size:"sm",weight:"bold",overflow:"normal"},e)))}var q=n("i8i4"),V=n("KNE1"),K=n("eo+c");const Q=300,Z=80,J=-Q/2,ee=20,te=40,ne=24,ie=-8,oe=9,ae={icon:{backgroundRepeat:"no-repeat",backgroundSize:"cover"},loading:{opacity:0,transitionDuration:"0.25s",transitionTimingFunction:"ease-out",transitionProperty:"transform, opacity",transform:"scaleX(1) scaleY(1) translateZ(0) translateY(25px)",transformOrigin:"bottom"},loaded:{opacity:1,transitionDuration:"0.2s",transitionTimingFunction:"ease-out",transitionProperty:"transform, opacity",transform:"scaleX(1) scaleY(1)",transformOrigin:"bottom"},clicked:{transition:"transform 0.2s ease-out",transform:`translateY(-30px) scaleX(${64/te}) scaleY(${64/te})`,transformOrigin:"bottom",position:"relative",zIndex:1},flying:{transition:"transform 0.2s ease-out",transformOrigin:"bottom"},label:{transition:"transform 0.2s ease-out",transform:`scale(${te/64})`,transformOrigin:"bottom",whiteSpace:"nowrap"},fading:{opacity:0,transition:"opacity 0.2s ease-out"}},re={boxShadow:"0 9px 26px rgba(0, 0, 0, 0.4)"};function se({reactionButtonRect:e,handleReactionTrayClick:t}){const[n,a]=Object(i.useState)("loading"),[r,s]=Object(i.useState)(""),[l,c]=Object(i.useState)(),[d,m]=Object(i.useState)(!1),[u,p]=Object(i.useState)({}),[h]=Object(i.useState)(e),f=Object(i.useRef)(),g=Object(i.useRef)({});Object(i.useEffect)(()=>{"loading"===n&&(f.current=requestAnimationFrame(()=>a("loaded"))),(()=>{m(!0);const e={...u};K.c.forEach(t=>{const n=Object(q.findDOMNode)(g.current[t]);g.current[t]&&n instanceof HTMLElement&&!e[t]&&(e[t]=n.getBoundingClientRect())}),Object.keys(e).length===K.c.length&&p(e)})(),!l&&d&&(()=>{const e={...l};K.c.forEach(t=>{const n=u[t],{left:i,top:o}=h,{left:a,top:r}=n,s=i-a+ie,l=o-r+oe;e[t]={translateX:s,translateY:l}}),c(e)})()},[d,e]);const b=()=>{"clicked"===n&&r&&(a("flying"),setTimeout(()=>{t(r)},750))},y=K.c.map((e,t)=>{const{staticAsset:i,animatedAsset:a,label:s,htmlStyle:c,animationStyle:d}=Object(K.a)(e),m={transitionDelay:`${.08*t}s`,...ae[n]},u={...r===e?ae.clicked:ae.loaded},p={...l&&r===e?{transform:`translateZ(0) translateX(${l[e].translateX}px) translateY(${l[e].translateY}px) scaleX(${ne/te}) scaleY(${ne/te}) `,...ae[n]}:ae.fading};let h={};return"loading"===n||"loaded"===n?h={...m}:"clicked"===n?h={...u}:"flying"===n&&(h={...p}),o.a.createElement(x.d,{display:"flex",alignSelf:"center",justifyContent:"between",key:t},o.a.createElement(x.d,{maxHeight:te,maxWidth:te,display:"flex",alignItems:"center",justifyContent:"center",position:"relative",dangerouslySetInlineStyle:{__style:{...h}},ref:t=>{g.current[e]=t}},r!==e&&o.a.createElement(x.d,{position:"absolute",top:!0,left:!0,bottom:!0,right:!0},o.a.createElement(x.d,{width:te,height:te,dangerouslySetInlineStyle:{__style:{backgroundImage:`url(${i})`,backgroundPosiiton:"center",backgroundRepeat:"no-repeat",backgroundSize:"cover"}}})),o.a.createElement(x.d,{display:"flex",alignItems:"center",justifyContent:"center",direction:"column",position:"relative"},o.a.createElement(V.a,{unsafeCSS:c}),r===e&&"clicked"===n&&o.a.createElement(x.d,{rounding:"pill",color:"darkGray",height:ee,dangerouslySetInlineStyle:{__style:ae.label},display:"flex",alignItems:"center",justifyContent:"center",paddingY:1,paddingX:2},o.a.createElement(x.R,{color:"white",size:"sm",weight:"bold",overflow:"normal"},s)),o.a.createElement("div",{onClick:b,onKeyDown:b,role:"presentation"},o.a.createElement(x.d,{width:te,height:te,display:"flex",alignItems:"center",justifyContent:"center",dangerouslySetInlineStyle:{__style:{...ae.icon,...r===e&&"clicked"===n?{animation:d}:{},backgroundImage:`url(${a})`}}})))))});return o.a.createElement(x.d,{position:"absolute",display:"flex",alignItems:"center",justifyContent:"center",dangerouslySetInlineStyle:{__style:{marginLeft:J}}},o.a.createElement(x.d,{display:"flex",alignItems:"center",justifyContent:"center",width:Q,height:Z,rounding:"pill",color:"flying"===n?"transparent":"white",dangerouslySetInlineStyle:{__style:{..."flying"!==n?re:{}}},onMouseMove:e=>{const{clientX:t}=e;if("flying"!==n){const e=(e=>{let t;return d&&K.c.forEach(n=>{const i=u[n];if(i&&i.left&&i.right){const{left:o,right:a}=i;e>=o&&e<=a&&(t=n)}}),t||null})(t);e!==r&&s(e),a("clicked")}}},o.a.createElement(x.d,{display:"flex",alignItems:"center",justifyContent:"around",width:"100%",paddingX:5},y)))}var le=n("eOdZ");function ce(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}const de=24,me=44,ue={base:{borderRadius:"50%"},hovered:{backgroundColor:"rgb(226, 226, 226)"},active:{backgroundColor:"rgb(218, 218, 218)"},focused:{boxShadow:"0 0 0 4px rgba(0, 132, 255, 0.5)",outline:0}},pe=500,he=300;var fe=Object(h.connect)(null,e=>({pinUpdateReactionCount:(t,n,i)=>e(function(e,t,n){return{type:"PIN_UPDATE_REACTION_COUNT",payload:{id:e,increment:t,reactionType:n}}}(t,n,i))}))(class extends i.PureComponent{constructor(...e){super(...e),ce(this,"state",{clickedReaction:0,isConfirmationShowing:!1,isReactionTrayShowing:!1,reactionButtonRect:null,useInitialReaction:!0,isHoveringOverTray:!1,isHoveringOverButton:!1}),ce(this,"reactionButtonRef",o.a.createRef()),ce(this,"trayOpenTimer",null),ce(this,"trayCloseTimer",null),ce(this,"onResize",()=>{this.setReactionButtonRect(),this.startTrayCloseTimer()}),ce(this,"onScroll",()=>{this.setReactionButtonRect(),this.startTrayCloseTimer()}),ce(this,"handleExperienceMount",e=>{e&&e.complete&&(501977===e.experience_id||501995===e.experience_id)&&(this.tooltipExperience=e)}),ce(this,"handleReact",(e=7)=>{const{pinId:t,pinUpdateReactionCount:n}=this.props,i={pin_id:t,reaction_type:e};this.setState({clickedReaction:e,useInitialReaction:!1}),n(t,!0,e),le.a.create("ReactionsResource",i).callUpdate()}),ce(this,"handleUnreact",()=>{const{pinId:e}=this.props,t={pin_id:e};this.setState({clickedReaction:0,useInitialReaction:!1}),le.a.create("ReactionsResource",t).callDelete()}),ce(this,"setReactionButtonRect",()=>{if(this.reactionButtonRef.current&&this.reactionButtonRef.current instanceof HTMLElement){const e=this.reactionButtonRef.current.getBoundingClientRect();this.setState({reactionButtonRect:e})}}),ce(this,"closeTray",()=>{this.setState({isReactionTrayShowing:!1})}),ce(this,"startTrayCloseTimer",()=>{clearTimeout(this.trayCloseTimer),this.trayCloseTimer=setTimeout(()=>{const{isHoveringOverTray:e,isHoveringOverButton:t}=this.state;e||t||this.closeTray()},he)}),ce(this,"handleOnHoverButton",()=>{this.setState({isHoveringOverButton:!0}),clearTimeout(this.trayOpenTimer),this.trayOpenTimer=setTimeout(()=>{const{isReactionTrayShowing:e,isHoveringOverButton:t}=this.state;!e&&t&&this.setState({isReactionTrayShowing:!0})},pe),this.tooltipExperience&&this.tooltipExperience.complete()}),ce(this,"handleOffHoverButton",()=>{this.setState({isHoveringOverButton:!1}),this.startTrayCloseTimer()}),ce(this,"handleOnHoverTray",()=>{this.setState({isHoveringOverTray:!0})}),ce(this,"handleOffHoverTray",()=>{this.setState({isHoveringOverTray:!1}),this.startTrayCloseTimer()}),ce(this,"handleClickButton",()=>{const{clickedReaction:e,useInitialReaction:t}=this.state,{pinId:n,pinUpdateReactionCount:i,reactionByMe:o}=this.props,a=t?o:e;a?(i(n,!1,a),this.handleUnreact()):this.setReaction("love"),clearTimeout(this.trayOpenTimer),this.closeTray(),Object(k.a)(101,{view:3,viewParameter:139,element:11354,objectId:n})}),ce(this,"setReaction",e=>{this.handleReact(Object(K.a)(e).type),this.handleShowConfirmation()}),ce(this,"handleShowConfirmation",()=>{this.setState({isConfirmationShowing:!0})}),ce(this,"handleHideConfirmation",()=>{this.setState({isConfirmationShowing:!1},this.startTrayCloseTimer)})}componentDidMount(){this.setReactionButtonRect(),window.addEventListener("mouseover",this.setReactionButtonRect)}componentWillUnmount(){clearTimeout(this.trayOpenTimer),clearTimeout(this.trayCloseTimer),window.removeEventListener("mouseover",this.setReactionButtonRect)}render(){const{isReactionTrayShowing:e,reactionButtonRect:t,isConfirmationShowing:n,clickedReaction:i,useInitialReaction:a,isHoveringOverTray:r}=this.state,{reactionByMe:s,showTooltip:l}=this.props,c=a?s:i,d=c?K.b[c]:"default",{staticAsset:m,label:u}=Object(K.a)(d);return o.a.createElement(x.d,{position:"relative"},o.a.createElement(X.a,{accessibilityLabel:"reaction",onClick:this.handleClickButton,onMouseEnter:this.handleOnHoverButton,onMouseLeave:this.handleOffHoverButton,style:{display:"block",border:"none",padding:0,cursor:"pointer",background:"transparent",outline:"none",borderRadius:"50%"}},({active:e,hovered:t,focused:n})=>{let i={...ue.base};return e?i={...ue.base,...ue.active}:t||r?i={...ue.base,...ue.hovered}:n&&(i={...ue.base,...ue.focused}),o.a.createElement(x.d,{color:"transparent",rounding:"circle",dangerouslySetInlineStyle:{__style:i}},o.a.createElement(x.d,{display:"flex",justifyContent:"center",alignItems:"center",dangerouslySetInlineStyle:{__style:{minHeight:me,minWidth:me}}},o.a.createElement(x.d,{height:de,width:de,ref:this.reactionButtonRef,display:"flex",alignItems:"center",justifyContent:"center",dangerouslySetInlineStyle:{__style:{backgroundRepeat:"no-repeat",backgroundSize:"cover",backgroundPosiiton:"center",backgroundImage:`url(${m})`}}})))}),l&&!e&&!n&&a&&o.a.createElement(Y,{experienceIds:[501977,501995],idealDirection:"down",placementId:12,anchor:this.reactionButtonRef.current,flyoutSize:"lg",onExperienceMount:this.handleExperienceMount}),e&&!!t&&!!t.left&&!!t.top&&o.a.createElement(x.d,{display:"flex",justifyContent:"center",alignItems:"center"},o.a.createElement(x.M,{top:0},o.a.createElement(x.Q,{onMouseEnter:this.handleOnHoverTray,onMouseLeave:this.handleOffHoverTray},o.a.createElement(se,{reactionButtonRect:t,handleReactionTrayClick:this.setReaction})))),n&&!!c&&u&&o.a.createElement(W,{reactionLabel:u,handleHideConfirmation:this.handleHideConfirmation}))}}),ge=n("rYoy"),be=n("zXAL"),ye=n("T5j3"),we=n("/zJj");function Ee(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}n.d(t,"CloseupActionBar",(function(){return Se}));const _e=Object(i.lazy)(()=>n.e("SecondarySendButtonCommon").then(n.bind(null,"fepT")));class Se extends o.a.Component{constructor(e){super(e),Ee(this,"sendExperienceComplete",()=>{}),Ee(this,"handleExternalSend",()=>{this.sendExperienceComplete()}),Ee(this,"onSendExperienceMount",e=>{e&&e.complete&&500946===e.experience_id&&(this.sendExperienceComplete=e.complete)}),Ee(this,"promoteButtonRef",Object(i.createRef)()),this.sendButtonTooltipRef=o.a.createRef()}render(){const{editable:e,gridDescription:t,hideButtons:n,hidePromoteButton:i,imageSrc:a,isFlyoutOpen:r,isOnSecretBoard:s,isPdp:l,onEditSubmit:d,onFlyoutDismiss:m,onToggleFlyout:u,pin:p,promoteButton:h,saveButton:f,shareButtonRef:g,viewParameter:b}=this.props,y=s?null:o.a.createElement(ge.a,null,o.a.createElement(x.d,null,o.a.createElement(x.d,{ref:this.sendButtonTooltipRef},o.a.createElement(_e,{buttonType:"icon",gridDescription:t,imageSrc:a,isFlyoutOpen:r,onExternalSend:this.handleExternalSend,onFlyoutDismiss:m,onToggleFlyout:u,pinId:p.id,sendType:"pin",shareButtonRef:g})),f&&!r&&o.a.createElement(Y,{experienceIds:[500946],placementId:12,anchor:this.sendButtonTooltipRef.current,onExperienceMount:this.onSendExperienceMount}))),w=Object(ye.c)(p),E=o.a.createElement(x.d,{display:"flex",color:"white",justifyContent:n?"end":"between",rounding:2,"data-test-id":"closeup-action-items",maxWidth:l?we.f:we.d},!n&&o.a.createElement(x.d,{display:"flex"},e&&o.a.createElement(x.d,{marginEnd:1},o.a.createElement(c,{carouselSlotCurrentIndex:p&&p.carousel_data&&p.carousel_data.index,pinId:p.id,onSubmit:d,view:3,viewParameter:b})),o.a.createElement(z,{pin:p,viewParameter:b})),o.a.createElement(x.d,{alignItems:"center",display:"flex"},y,w&&o.a.createElement(ge.a,null,o.a.createElement(fe,{pinId:p.id,reactionByMe:p.reaction_by_me,showTooltip:!0})),!i&&h&&o.a.createElement(ge.a,null,o.a.createElement(o.a.Fragment,null,o.a.createElement(x.d,{ref:this.promoteButtonRef},h),o.a.createElement(Y,{experienceIds:[501121],idealDirection:"down",placementId:12,anchor:this.promoteButtonRef.current,flyoutSize:"lg"})))));return o.a.createElement(o.a.Fragment,null,o.a.createElement(x.d,{display:"flex",justifyContent:"between"},E,o.a.createElement(x.d,{marginStart:3},f)))}}t.default=Object(be.a)(Se)}}]);
//# sourceMappingURL=https://sm.pinimg.com/webapp/js/CloseupActionBarCommon-57fcd93e269c798f4070.mjs.map