AplikasiOpenBoView = require './aplikasi-open-bo-view'
{CompositeDisposable} = require 'atom'

module.exports = AplikasiOpenBo =
  aplikasiOpenBoView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @aplikasiOpenBoView = new AplikasiOpenBoView(state.aplikasiOpenBoViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @aplikasiOpenBoView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'aplikasi-open-bo:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @aplikasiOpenBoView.destroy()

  serialize: ->
    aplikasiOpenBoViewState: @aplikasiOpenBoView.serialize()

  toggle: ->
    console.log 'AplikasiOpenBo was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
