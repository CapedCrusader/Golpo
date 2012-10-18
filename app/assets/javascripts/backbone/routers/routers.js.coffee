class  SampleApp.Routers.PostsRouter extends Backbone.Router

  initialize: (options) ->
     @posts = new SampleApp.Collections.PostsCollection()
     @posts.reset options.posts


  routes:
    "index"     : "index"
    "new"       : "newPost"
    ":id"       : "show"
    ":id/edit"  : "edit"
    ".*"        : "index"

  index: ->
    @view = new SampleApp.Views.PostsIndexView({collection: @posts})

  newPost: ->
    @view = new SampleApp.Views.PostsNewView({collection: @posts})

  show: (id) ->
    post = @posts.get(id)
    @view = new SampleApp.Views.PostsShowView({model: post})

  edit: (id) ->
    post = @posts.get(id)
    @view = new SampleApp.Views.PostsEditView({model: post})
        
