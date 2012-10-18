class SampleApp.Models.Post extends Backbone.Model
  paramRoot: 'post'

  defaults:
    title: null
    content: null

class SampleApp.Collections.PostsCollection extends Backbone.Collection
  model: SampleApp.Models.Post
  url: '/posts'
