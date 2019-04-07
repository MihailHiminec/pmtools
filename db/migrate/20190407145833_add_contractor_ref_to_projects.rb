class AddContractorRefToProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :contractor, foreign_key: true
  end
end
