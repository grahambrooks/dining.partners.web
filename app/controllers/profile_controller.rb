class ProfileController < ApplicationController
  def view
    profiles = {
        dave: {name: 'Dave'},
        tom: {name: 'Tom'}
    }

    @profile = profiles[params[:id].to_sym]
  end
end
