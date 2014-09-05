contains =
  text: (browser, text) ->
    pageText = browser.body.textContent.replace(/\s+/g, " ")
    throw new Error("Could not find: " + text) unless pageText.search(text) > 0

module.exports = contains
