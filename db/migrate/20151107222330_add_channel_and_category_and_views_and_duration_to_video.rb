class AddChannelAndCategoryAndViewsAndDurationToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :channel, :string
    add_column :videos, :views, :string
    add_column :videos, :category, :string
    add_column :videos, :duration, :string
  end
end
