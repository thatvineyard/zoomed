module.exports = {
  devServer: {
    disableHostCheck: true,
    public: "localhost/" + process.env.BASE_PATH,
    port: 8080,
    sockPath: "/" + process.env.BASE_PATH + "sockjs-node",
    historyApiFallback: true
  },
  publicPath: "/" + process.env.BASE_PATH
}