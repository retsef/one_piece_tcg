// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
//  <h4>Tasks</h4>
//  <div data-controller="nested-form">
//    <template data-target="nested-form.template">
//      <%= form.fields_for :tasks, Task.new, child_index: 'NEW_RECORD' do |task| %>
//        <%= render "task_fields", form: task %>
//      <% end %>
//    </template>
//
//    <%= form.fields_for :tasks do |task| %>
//      <%= render "task_fields", form: task %>
//    <% end %>
//
//    <div class="mb-3" data-target="nested-form.links">
//      <%= link_to "Add Task", "#", class: "btn btn-outline-primary", data: { action: "click->nested-form#add_association" } %>
//    </div>
//  </div>
//
//  # _task_fields.html.erb
//  <%= content_tag :div, class: "nested-fields", data: { new_record: form.object.new_record? } do %>
//    <div class="form-group">
//      <%= form.label :description %>
//      <%= form.text_field :description, class: 'form-control' %>
//      <small><%= link_to "Remove", "#", data: { action: "click->nested-form#remove_association" } %></small>
//    </div>
//
//    <%= form.hidden_field :_destroy %>
//  <% end %>

import ApplicationController from 'controllers/application_controller'
import { addClassUnlessExist, removeClassIfExist } from 'helpers'

export default class extends ApplicationController {
  static targets = ['container', 'links', 'template', 'empty']
  static values = {
    hiddenClass: { type: String, default: 'hidden' },
    wrapperClass: { type: String, default: 'nested-fields' },
    insertMode: { type: String, default: 'beforeend' },

    beforeInsertEvent: { type: String, default: 'nested_fields:before-insert' },
    afterInsertEvent: { type: String, default: 'nested_fields:after-insert' },
    beforeRemoveEvent: { type: String, default: 'nested_fields:before-remove' },
    afterRemoveEvent: { type: String, default: 'nested_fields:after-remove' }
  }

  add_association (event) {
    const newNode = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())

    this.containerTarget.dispatchEvent(
      new CustomEvent(this.beforeInsertEventValue, { detail: newNode, bubbles: true, cancelable: true })
    )

    this.containerTarget.insertAdjacentHTML(this.insertModeValue, newNode)

    this.containerTarget.dispatchEvent(
      new CustomEvent(this.afterInsertEventValue, { detail: newNode, bubbles: true, cancelable: true })
    )
  }

  remove_association (event) {
    const nodeToDelete = event.target.closest(`.${this.wrapperClassValue}`)

    const wrapper = nodeToDelete.parentElement
    wrapper.dispatchEvent(
      new CustomEvent(this.beforeRemoveEventValue, { detail: nodeToDelete, bubbles: true, cancelable: true })
    )

    // New records are simply removed from the page
    if (nodeToDelete.dataset.newRecord === 'true') {
      nodeToDelete.remove()
    } else {
      // Existing records are hidden and flagged for deletion
      nodeToDelete.querySelector("input[name*='_destroy']").value = 1
      addClassUnlessExist(nodeToDelete, this.hiddenClassValue)
    }

    wrapper.dispatchEvent(
      new CustomEvent(this.afterRemoveEventValue, { detail: nodeToDelete, bubbles: true, cancelable: true })
    )
  }

  show_empty () {
    if (this.containerTarget.querySelectorAll(`.${this.wrapperClassValue}:not(${this.hiddenClassValue})`).length === 0) {
      removeClassIfExist(this.emptyTarget, this.hiddenClassValue)
    } else {
      addClassUnlessExist(this.emptyTarget, this.hiddenClassValue)
    }
  }
}
