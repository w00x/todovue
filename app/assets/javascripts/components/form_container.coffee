@form_container = ->
  mytodos = []

  Vue.component 'todo-item',
    props: ['todo']
    template: '#todo-item-comp'
    data: ->
      editable: false
    methods:
      active_edit: ->
        this.editable = !this.editable
      delete_todo: ->
        _this = this
        $.ajax
          url: '/api/v1/todos/'+this.todo.id+'.json'
          type: 'DELETE'
          success: (result) ->
            _this.$emit('deleteditem', _this.todo)
      update_todo: ->
        _this = this
        todo = { description: this.todo.description }
        $.ajax
          url: '/api/v1/todos/'+this.todo.id+'.json'
          type: 'PUT',
          data: todo
          success: (result) ->
            _this.$emit('updateditem', result)
      checkeditem: ->
        _this = this
        todo = { success: this.todo.success }
        $.ajax
          url: '/api/v1/todos/'+this.todo.id+'.json'
          type: 'PUT',
          data: todo
          success: (result) ->
            _this.$emit('updateditem', result)

  new Vue
    el: '#container-todo'
    data:
      todos: []
      description: ''
    methods:
      add_new_todo: ->
        _this = this
        todo = { description: this.description, success: false }
        $.post '/api/v1/todos.json', todo, (response)->
          _this.todos.push(response)
          _this.description = ''
      delitem: (todoDeleted)->
        indexDel = this.todos.indexOf(todoDeleted)
        this.todos.splice(indexDel, 1)
      upditem: (todoUpdated) ->
        indexDel = this.todos.indexOf(todoUpdated)
        this.todos[indexDel] = todoUpdated
    mounted: ->
      _this = this
      $.get '/api/v1/todos.json', (response)->
        _this.todos = response
