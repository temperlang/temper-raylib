
import {bind} from '../emcc/bind.js';
import {use} from 'temper-raylib/rl/raylib.js';
import {App as ConwayApp} from 'temper-raylib/demos/conway.js';
import {App as EmptyApp} from 'temper-raylib/demos/empty.js';
import {App as PongApp} from 'temper-raylib/demos/pong.js';
import {App as HashlifeApp} from 'temper-raylib/demos/hashlife.js';

const appByName = {
    'conway': ConwayApp,
    'empty': EmptyApp,
    'pong': PongApp,
    'hashlife': HashlifeApp,
};

const memory = () => {
    if (window.performance != null) {
        if (window.performance.memory != null) {
            // console.log(`${window.performance.memory.usedJSHeapSize / 1024 / 1024|0}m`);
        }
    }
};

const args = new URLSearchParams(location.search).get('args').split('\0');

if (args.length == 0) {
    args.push('hashlife');
}


const App = appByName[args[0]];

(async() => {
    const keys = Object.create(null);
    const newKeysDown = [];
    const newKeysUp = [];
    const mouseDown = [false, false, false, false, false, false, false, false, false];
    const newMouseDown = [];
    const newMouseUp = [];
    const keymap = {
        'Escape': 256,
        'Enter': 257,
        'Tab': 258,
        'Backspace': 259,
        'ArrowRight': 262,
        'ArrowLeft': 263,
        'ArrowDown': 264,
        'ArrowUp': 265,
    };
    window.addEventListener('keydown', (e) => {
        let c = e.key.toUpperCase().charCodeAt(0);
        if (keymap[e.key] != null) {
            c = keymap[e.key];
        } else if (e.key.length !== 1) {
            console.log(`Unhandled key: ${e.key}`);
            return;
        }
        keys[c] = true;
        newKeysDown.push(c);
    });
    window.addEventListener('keyup', (e) => {
        let c = e.key.toUpperCase().charCodeAt(0);
        if (keymap[e.key] != null) {
            c = keymap[e.key];
        } else if (e.key.length !== 1) {
            return;
        }
        keys[c] = false;
        newKeysUp.push(c);
    });
    window.addEventListener('mousedown', (e) => {
        mouseDown[e.button] = true;
        newMouseDown.push(e.button);
    });
    window.addEventListener('mouseup', (e) => {
        mouseDown[e.button] = false;
        newMouseUp.push(e.button);
    });
    const canvas = document.getElementById('canvas');
    const display = document.getElementById('display');
    const raylib = await bind();
    const GetMouseWheelMove = raylib.GetMouseWheelMove;
    raylib.GetMouseWheelMove = () => {
        return GetMouseWheelMove() * -0.01;
    };
    const watch = new Set();
    raylib.IsKeyDown = (k) => {
        watch.add(k);
        return keys[k] === true;
    };
    raylib.IsKeyUp = (k) => {
        watch.add(k);
        return keys[k] !== true;
    };
    raylib.IsKeyPressed = (k) => {
        watch.add(k);
        for (const e of newKeysDown) {
            if (k === e) {
                return true;
            }
        }
        return false;
    };
    raylib.IsKeyReleased = (k) => {
        watch.add(k);
        for (const e of newKeysUp) {
            if (k === e) {
                return true;
            }
        }
        return false;
    };
    raylib.IsMouseButtonDown = (b) => {
        return mouseDown[b];
    };
    raylib.IsMouseButtonUp = (b) => {
        return !mouseDown[b];
    };
    raylib.IsMouseButtonPressed = (k) => {
        for (const e of newMouseDown) {
            if (k === e) {
                return true;
            }
        }
        return false;
    };
    raylib.IsMouseButtonReleased = (k) => {
        for (const e of newMouseUp) {
            if (k === e) {
                return true;
            }
        }
        return false;
    };
    const WindowShouldClose = raylib.WindowShouldClose;
    raylib.WindowShouldClose = () => {
        const ret = WindowShouldClose();
        return new Promise((resolve, reject) => {
            requestAnimationFrame(() => {
                resolve(ret);
            });
        });
    };
    const SetTargetFPS = raylib.SetTargetFPS;
    raylib.SetTargetFPS = () => {
        SetTargetFPS(1000);
    };
    // raylib.SetConfigFlags = (flags) => {};
    use(raylib);
    raylib.lib.canvas = canvas;
    raylib.lib.FS.mkdir('demos');
    const res = await fetch('/hashlife.data');
    const text = await res.text();
    raylib.lib.FS.writeFile('demos/patterns.har', text);
    const app = new App(args.slice(1));
    while (!await raylib.WindowShouldClose()) {
        try {
            app.loop();
        } finally {
            newKeysDown.length = 0;
            newKeysUp.length = 0;
            newMouseDown.length = 0;
            newMouseUp.length = 0;
            memory();
        }
    }
    console.log("Window Closed");
})();