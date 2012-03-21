window.Renderer = 
  renderers: []
  renderMessage: (message) ->
    renderedResult = []
    for r in this.renderers
      renderedResult.push(r.render(message))
    renderedResult

class YoutubeRenderer
  pattern: /((http|https)\:\/\/)?([w]{3}\.)?((youtube|youtu)\.)([a-z]{2,4})(\/watch\?v=)([a-zA-Z0-9_-]+)(\&feature=)?([a-zA-Z0-9_-]+)?/
  render: (message) ->
    result = ''
    if match = message.match(this.pattern)
      v = message.match(/v=([a-zA-Z0-9-_]+)/)
      result = "<a href=\"#{match}\"><img src=\"http://img.youtube.com/vi/#{v[1]}/1.jpg\" /></a>"
    result

Renderer.renderers.push(new YoutubeRenderer())
