(function(t){function e(e){for(var a,r,o=e[0],c=e[1],u=e[2],d=0,f=[];d<o.length;d++)r=o[d],n[r]&&f.push(n[r][0]),n[r]=0;for(a in c)Object.prototype.hasOwnProperty.call(c,a)&&(t[a]=c[a]);l&&l(e);while(f.length)f.shift()();return i.push.apply(i,u||[]),s()}function s(){for(var t,e=0;e<i.length;e++){for(var s=i[e],a=!0,o=1;o<s.length;o++){var c=s[o];0!==n[c]&&(a=!1)}a&&(i.splice(e--,1),t=r(r.s=s[0]))}return t}var a={},n={app:0},i=[];function r(e){if(a[e])return a[e].exports;var s=a[e]={i:e,l:!1,exports:{}};return t[e].call(s.exports,s,s.exports,r),s.l=!0,s.exports}r.m=t,r.c=a,r.d=function(t,e,s){r.o(t,e)||Object.defineProperty(t,e,{enumerable:!0,get:s})},r.r=function(t){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},r.t=function(t,e){if(1&e&&(t=r(t)),8&e)return t;if(4&e&&"object"===typeof t&&t&&t.__esModule)return t;var s=Object.create(null);if(r.r(s),Object.defineProperty(s,"default",{enumerable:!0,value:t}),2&e&&"string"!=typeof t)for(var a in t)r.d(s,a,function(e){return t[e]}.bind(null,a));return s},r.n=function(t){var e=t&&t.__esModule?function(){return t["default"]}:function(){return t};return r.d(e,"a",e),e},r.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},r.p="/";var o=window["webpackJsonp"]=window["webpackJsonp"]||[],c=o.push.bind(o);o.push=e,o=o.slice();for(var u=0;u<o.length;u++)e(o[u]);var l=c;i.push([0,"chunk-vendors"]),s()})({0:function(t,e,s){t.exports=s("56d7")},2856:function(t,e,s){},"56d7":function(t,e,s){"use strict";s.r(e);s("cadf"),s("551c"),s("097d");var a=s("2b0e"),n=function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{attrs:{id:"app"}},[s("NavB"),s("section",{staticClass:"hero is-info"},[s("div",{staticClass:"hero-body"},[s("div",{staticClass:"container"},[s("h1",{staticClass:"title"},[t._v("\n                    "+t._s(t.$route.name)+"\n                ")])])])]),s("section",{staticClass:"section"},[s("router-view")],1)],1)},i=[],r=function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("nav",{staticClass:"navbar is-link is-fixed-top",attrs:{role:"navigation","aria-label":"dropdown navigation"}},[t._m(0),s("div",{staticClass:"navbar-menu"},[t.logged?s("div",{staticClass:"navbar-start"},[s("router-link",{staticClass:"navbar-item",attrs:{to:"/dash"}},[t._v("Dashboard")])],1):t._e(),s("div",{staticClass:"navbar-end"},[t.logged?t._e():s("router-link",{staticClass:"navbar-item",attrs:{to:"/login"}},[t._v("Login")]),t.logged?s("a",{staticClass:"navbar-item",on:{click:function(e){t.logout()}}},[t._v("Logout, "+t._s(t.username))]):t._e()],1)])])},o=[function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"navbar-brand"},[s("a",{staticClass:"navbar-item title",attrs:{href:"/"}},[t._v("\n            TBot\n        ")])])}],c="AUTH_REQUEST",u="AUTH_SUCCESS",l="AUTH_ERROR",d="AUTH_LOGOUT",f={name:"NavB",methods:{logout:function(){var t=this;this.$store.dispatch(d).then(function(){t.$router.push("/login")})}},computed:{username:function(){return this.$store.getters.username},logged:function(){return this.$store.getters.isAuthenticated}}},v=f,p=s("2877"),m=Object(p["a"])(v,r,o,!1,null,null,null);m.options.__file="Navbar.vue";var h=m.exports,b={components:{NavB:h}},_=b,g=(s("5c0b"),Object(p["a"])(_,n,i,!1,null,null,null));g.options.__file="App.vue";var C=g.exports,k=s("8a03"),O=s.n(k),x=s("bc3a"),y=s.n(x),w=s("a7fe"),$=s.n(w),j=(s("5abe"),s("8c4f")),S=function(){var t=this,e=t.$createElement;t._self._c;return t._m(0)},E=[function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"home"},[s("h1",{staticClass:"title"},[t._v("Welcome to home")])])}],L={name:"home"},T=L,A=Object(p["a"])(T,S,E,!1,null,null,null);A.options.__file="Home.vue";var P=A.exports,B=function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"columns"},[s("div",{staticClass:"column is-2 is-offset-5",attrs:{id:"login"}},[s("h1",{staticClass:"title"},[t._v("Log in")]),s("form",{on:{submit:function(e){return e.preventDefault(),t.login(e)}}},[s("b-field",{attrs:{type:t.failed}},[s("b-input",{attrs:{placeholder:"username",icon:"account"},model:{value:t.user.username,callback:function(e){t.$set(t.user,"username",e)},expression:"user.username"}})],1),s("b-field",{attrs:{type:t.failed}},[s("b-input",{attrs:{type:"password","password-reveal":"",placeholder:"password",icon:"lock"},model:{value:t.user.password,callback:function(e){t.$set(t.user,"password",e)},expression:"user.password"}})],1),s("b-field",[s("button",{staticClass:"button is-block is-info",attrs:{type:"submit"}},[t._v("Submit")])])],1)])])},U=[],M=s("7247"),D=s("f6c8"),H={components:{BField:D["a"],BInput:M["a"]},name:"Login",data:function(){return{user:{}}},methods:{login:function(){var t=this;this.$store.dispatch(c,this.user).then(function(){t.$router.push("/")})}},computed:{failed:function(){return"error"===this.$store.state.auth.status?"is-danger":""}}},I=H,R=(s("dcac"),Object(p["a"])(I,B,U,!1,null,"58b9f91a",null));R.options.__file="Login.vue";var N=R.exports,F=function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",[s("div",{staticClass:"columns"},[s("div",{staticClass:"column is-2"},[s("div",{staticClass:"card"},[s("div",{staticClass:"card-content"},[s("div",{staticClass:"media"},[s("div",{staticClass:"media-content"},[s("p",{staticClass:"title is-4"},[t._v("\n                                Send message\n                            ")]),s("hr"),s("form",{on:{submit:function(e){return e.preventDefault(),t.sendMsg(e)}}},[s("b-field",[s("b-input",{attrs:{type:"number",placeholder:"chat_id"},model:{value:t.msg.chat_id,callback:function(e){t.$set(t.msg,"chat_id",e)},expression:"msg.chat_id"}})],1),s("b-field",[s("b-input",{attrs:{type:"textarea",placeholder:"text"},model:{value:t.msg.text,callback:function(e){t.$set(t.msg,"text",e)},expression:"msg.text"}})],1),s("button",{staticClass:"button is-link is-block"},[t._v("Send")])],1)])])])])]),s("div",{staticClass:"column is-2 is-offset-3"},[s("div",{staticClass:"card"},[s("div",{staticClass:"card-content"},[s("div",{staticClass:"media"},[s("div",{staticClass:"media-content"},[s("p",{staticClass:"title is-4"},[t._v("\n                                "+t._s(t.bot.first_name)+"\n                            ")]),s("hr"),s("a",{staticClass:"subtitle is-6",attrs:{href:t.bot_url}},[t._v("@"+t._s(t.bot.username))]),s("p")])])])])])]),s("div",{staticClass:"columns"},t._l(t.chats,function(t){return s("Chat",{attrs:{chat:t}})}))])},J=[],z=function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"column is-2"},[s("div",{staticClass:"card"},[s("div",{staticClass:"card-content"},[s("div",{staticClass:"media"},[s("div",{staticClass:"media-content"},[s("div",{staticClass:"field is-grouped is-multiline"},[t.private&&t.chat.username?s("div",{staticClass:"control"},[s("div",{staticClass:"tags has-addons"},[s("span",{staticClass:"tag is-dark"},[t._v("usr")]),s("a",{staticClass:"tag is-link",attrs:{href:t.url}},[t._v("@"+t._s(t.chat.username))])])]):t._e(),s("div",{staticClass:"control"},[s("div",{staticClass:"tags has-addons"},[s("span",{staticClass:"tag is-dark"},[t._v("type")]),t.private?s("span",{staticClass:"tag is-success"},[t._v("pm")]):s("span",{staticClass:"tag is-warning"},[t._v("grp")])])])]),s("p",{staticClass:"title is-5"},[t._v("\n                        "+t._s(t.chat.first_name||t.chat.title)+"\n                    ")]),s("p",{staticClass:"subtitle is-6"},[t._v(t._s(t.chat.id))])])])])])])},G=[],Q={props:["chat"],computed:{private:function(){return"private"===this.chat.type},url:function(){return"https://t.me/"+this.chat.username}}},W=Q,q=Object(p["a"])(W,z,G,!1,null,null,null);q.options.__file="Chat.vue";var K=q.exports,V={components:{BInput:M["a"],BField:D["a"],Chat:K},data:function(){return{msg:{},bot:{},chats:[]}},methods:{sendMsg:function(){this.axios.post("send_msg",this.msg)}},computed:{bot_url:function(){return"https://t.me/"+this.bot.username}},beforeMount:function(){var t=this;this.axios.get("get_me").then(function(e){t.bot=e.data}),this.axios.get("get_chats").then(function(e){t.chats=e.data.chats})}},X=V,Y=Object(p["a"])(X,F,J,!1,null,null,null);Y.options.__file="Dashboard.vue";var Z,tt,et=Y.exports,st=s("2f62"),at=s("a322"),nt=(s("28a5"),{token:localStorage.getItem("user-token")||"",status:"",hasLoadedOnce:!1}),it={isAuthenticated:function(t){return!(""===t.token)},username:function(t){return t.token.split(";")[0]},authStatus:function(t){return t.status}},rt=(Z={},Object(at["a"])(Z,c,function(t,e){var s=t.commit;t.dispatch;return new Promise(function(t,a){s(c),y()({url:"auth",data:e,method:"POST"}).then(function(e){localStorage.setItem("user-token",e.data.token),y.a.defaults.headers.common["Authorization"]=e.data.token,s(u,e.data),t(e)}).catch(function(t){s(l,t),localStorage.removeItem("user-token"),a(t)})})}),Object(at["a"])(Z,d,function(t){var e=t.commit;t.dispatch;return new Promise(function(t,s){e(d),localStorage.removeItem("user-token"),t()})}),Z),ot=(tt={},Object(at["a"])(tt,c,function(t){t.status="loading"}),Object(at["a"])(tt,u,function(t,e){t.status="success",t.token=e.token,t.hasLoadedOnce=!0}),Object(at["a"])(tt,l,function(t){t.status="error",t.hasLoadedOnce=!0}),Object(at["a"])(tt,d,function(t){t.token=""}),tt),ct={state:nt,getters:it,actions:rt,mutations:ot};a["default"].use(st["a"]);var ut=!1,lt=new st["a"].Store({modules:{auth:ct},strict:ut});a["default"].use(j["a"]);var dt=new j["a"]({mode:"history",linkExactActiveClass:"is-active",base:"/",routes:[{path:"/",name:"Home",component:P},{path:"/dash",name:"Dashboard",component:et},{path:"/login",name:"Login",component:N}]});y.a.defaults.crossDomain=!0,y.a.defaults.baseURL="/api",a["default"].use($.a,y.a),a["default"].use(O.a),a["default"].config.productionTip=!1,new a["default"]({router:dt,store:lt,render:function(t){return t(C)}}).$mount("#app")},"5c0b":function(t,e,s){"use strict";var a=s("2856"),n=s.n(a);n.a},"95cd":function(t,e,s){},dcac:function(t,e,s){"use strict";var a=s("95cd"),n=s.n(a);n.a}});
//# sourceMappingURL=app.a26494a4.js.map