export {ToyVue};

let effects = new Map();
let currentEffect = null;

function effect(fn) {
    currentEffect = fn;
    fn();
    currentEffect = null;
}

function havePropOrObj(obj, prop) {
    return effects.has(obj) && effects.get(obj).has(prop);
}

function checkEffects(obj, prop) {
    if (!effects.has(obj))
        effects.set(obj, new Map);

    if (!effects.get(obj).has(prop))
        effects.get(obj).set(prop, new Array);
}


function reactive(object) {
    let proxy = new Proxy(object, {
        //依赖收集
        get(obj, prop) {
            if (currentEffect) {
                checkEffects(obj, prop);
                effects.get(obj).get(prop).push(currentEffect);
            }

            return obj[prop];
        },

        set(obj, prop, value) {
            obj[prop] = value;
            if (havePropOrObj(obj, prop)) {
                effects.get(obj).get(prop).forEach(effect => effect());
            }
            return value;
        }

    });

    return proxy;
}

class ToyVue {
    constructor(config) {
        this.template = document.querySelector(config.el);
        this.data = reactive(config.data);
        this.traversal(this.template);
    }

    traversal(node) {
        
        if (node.nodeType === Node.TEXT_NODE) {
            if (node.textContent.trim().match(/^{{([\s\S]+)}}$/)) {
                let name = RegExp.$1;
                
            }

        }

        if (node.childNodes && node.childNodes.length) {
            node.childNodes.forEach(child => this.traversal(child));
        }
    }
}


