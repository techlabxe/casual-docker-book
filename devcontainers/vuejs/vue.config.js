module.exports = {
  configureWebpack: {
    devtool: 'source-map',
  },
  devServer: {
    // Devcontainer の中で編集をリアルタイム反映するには指定が必要.
    watchOptions: {
      poll: 3000
    }
  }
}