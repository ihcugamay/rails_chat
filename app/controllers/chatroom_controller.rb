# frozen_string_literal: true

# ChatroomController
class ChatroomController < ApplicationController
  def index
    @messages = Message.all
  end
end
