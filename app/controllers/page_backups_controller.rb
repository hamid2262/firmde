class PageBackupsController < ApplicationController
  authorize_resource

  def replace
    page = Page.find params[:page_id]
    page_backup = PageBackup.find params[:id]

    page.title = page_backup.title
    page.body = page_backup.body
    page.title_on_image = page_backup.title_on_image
    page.subtitle_on_image = page_backup.subtitle_on_image
    page.save
    redirect_to [:edit, page], notice: "page replaced"
  end
end
