#!/usr/bin/env node

import raylib from 'raylib';

import { use } from 'temper-raylib/rl/raylib.js'

import { argv } from 'node:process';

const game = argv[2];

use(raylib);

(async () => {
    const { main } = await import(`temper-raylib/demos/${game}.js`);
    try {
        main(argv.slice(3));
    } catch (e) {
        console.error(e);
    }
})();
