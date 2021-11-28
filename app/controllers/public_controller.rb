class PublicController < ApplicationController
  def main
    @properties = Property.newest
  end
end
