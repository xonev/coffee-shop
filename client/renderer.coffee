window.Renderer = 
  renderers: []
  renderMessage: (message) ->
    renderedResult = []
    for r in this.renderers
      renderedResult.push(r.render(message))
    renderedResult

class YoutubeRenderer
  pattern: /((http|https)\:\/\/)?([w]{3}\.)?(youtube\.)([a-z]{2,4})(\/watch\?v=)([a-zA-Z0-9_-]+)(\&feature=)?([a-zA-Z0-9_-]+)?/
  render: (message) -> 'youtube'

Renderer.renderers.push(new YoutubeRenderer())
