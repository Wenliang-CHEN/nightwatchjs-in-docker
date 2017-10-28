module.exports = {
  'Demo test Google' : function (browser) {
    browser
      .url('http://www.google.de')
      .waitForElementVisible('body', 1000)
      .end();
  }
};