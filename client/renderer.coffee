window.Renderer =
  renderers: []
  renderMessage: (message) ->
    renderedResult = []
    for r in this.renderers
      renderedResult.push(r.render(message))
    renderedResult

class YoutubeRenderer
  pattern: /(?:^|\s)((http|https)\:\/\/)?([w]{3}\.)?((youtube|youtu)\.)([a-z]{2,4})(\/watch\?v=)([a-zA-Z0-9_-]+)(\&feature=)?([a-zA-Z0-9_-]+)?(?:$|\s)/
  render: (message) ->
    result = ''
    if match = message.match(this.pattern)
      v = message.match(/v=([a-zA-Z0-9-_]+)/)
      result = "<a href=\"#{match}\"><img src=\"http://img.youtube.com/vi/#{v[1]}/1.jpg\" /></a>"
    result

Renderer.renderers.push(new YoutubeRenderer())

class ImgurRenderer
  pattern: /(?:^|\s)http\:\/\/(?:i\.imgur\.com\/(?:.*?)\.(?:jpg|png|gif)|imgur\.com\/(?:gallery\/)?([^\s]*))(?:\s|$)/
  render: (message) ->
    result = @pattern.exec(message)
    if result?
      if result[1]?
        imageUrl = "http://i.imgur.com/#{result[1]}.jpg"
      else
        imageUrl = result[0]
      return "<a href='#{imageUrl}'><img width='80' height='80' src='#{imageUrl}' /></a>"
    return ""

Renderer.renderers.push(new ImgurRenderer())
