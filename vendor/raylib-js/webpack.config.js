import CopyPlugin from 'copy-webpack-plugin';
import path from 'path';

export default {
    mode: 'production',
    entry: './source/index.js',
    output: {
        clean: true,
        path: path.resolve('public'),
        filename: 'index.js',
    },
    resolve: {
        modules: [path.resolve('..', '..', 'node_modules'), 'node_modules']
    },
    module: {
        rules: [
            {
                test: /\.m?js$/,
                use: {
                    loader: 'babel-loader',
                    options: {
                        presets: [
                            [
                                '@babel/preset-env',
                                {
                                    targets: "chrome 60"
                                },
                            ],
                            // [
                            //     'minify',
                            //     {
                            //         builtIns: false,
                            //         // evaluate: false,
                            //         mangle: false,
                            //     },
                            // ],
                        ],
                    },
                },
            },
        ],
    },
    performance: {
        hints: false,
        maxEntrypointSize: 512000,
        maxAssetSize: 512000
    },
    plugins: [
        new CopyPlugin({
            patterns: [
                { from: "../../demos/patterns.har", to: "hashlife.data" },
                { from: "source/index.html", to: "index.html" },
            ],
        }),
    ],
};
