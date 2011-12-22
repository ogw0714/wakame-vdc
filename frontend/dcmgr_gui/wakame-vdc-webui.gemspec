# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "wakame-vdc-webui"
  s.version = "11.12.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["axsh Ltd."]
  s.date = "2011-12-22"
  s.description = "Datacenter Hypervisor"
  s.email = ["dev@axsh.net"]
  s.files = ["app/controllers/security_groups_controller.rb", "app/controllers/instances_controller.rb", "app/controllers/users_controller.rb", "app/controllers/volumes_controller.rb", "app/controllers/home_controller.rb", "app/controllers/storage_pools_controller.rb", "app/controllers/dialog_controller.rb", "app/controllers/host_pools_controller.rb", "app/controllers/machine_images_controller.rb", "app/controllers/keypairs_controller.rb", "app/controllers/instance_specs_controller.rb", "app/controllers/snapshots_controller.rb", "app/controllers/accounts_controller.rb", "app/controllers/sessions_controller.rb", "app/controllers/application_controller.rb", "app/controllers/information_controller.rb", "app/helpers/snapshots_helper.rb", "app/helpers/host_pools_helper.rb", "app/helpers/information_helper.rb", "app/helpers/storage_pools_helper.rb", "app/helpers/machine_images_helper.rb", "app/helpers/sessions_helper.rb", "app/helpers/keypairs_helper.rb", "app/helpers/instances_helper.rb", "app/helpers/application_helper.rb", "app/helpers/dialog_helper.rb", "app/helpers/home_helper.rb", "app/helpers/security_groups_helper.rb", "app/helpers/volumes_helper.rb", "app/helpers/users_helper.rb", "app/helpers/accounts_helper.rb", "app/models/schema.rb", "app/models/account.rb", "app/models/tag_mapping.rb", "app/models/information.rb", "app/models/authz.rb", "app/models/dcmgr_resource/security_group.rb", "app/models/dcmgr_resource/instance_spec.rb", "app/models/dcmgr_resource/image.rb", "app/models/dcmgr_resource/account.rb", "app/models/dcmgr_resource/volume.rb", "app/models/dcmgr_resource/mock.rb", "app/models/dcmgr_resource/ssh_key_pair.rb", "app/models/dcmgr_resource/host_pool.rb", "app/models/dcmgr_resource/instance.rb", "app/models/dcmgr_resource/base.rb", "app/models/dcmgr_resource/volume_snapshot.rb", "app/models/dcmgr_resource/storage_pool.rb", "app/models/user.rb", "app/models/tag.rb", "app/models/oauth_token.rb", "app/models/base_new.rb", "app/models/oauth_consumer.rb", "app/views/keypairs/index.html.erb", "app/views/snapshots/index.html.erb", "app/views/storage_pools/index.html.erb", "app/views/dialog/delete_ssh_keypair.html.erb", "app/views/dialog/create_volume_from_snapshot.html.erb", "app/views/dialog/start_instances.html.erb", "app/views/dialog/terminate_instances.html.erb", "app/views/dialog/create_and_edit_security_group.html.erb", "app/views/dialog/create_snapshot.html.erb", "app/views/dialog/detach_volume.html.erb", "app/views/dialog/stop_instances.html.erb", "app/views/dialog/delete_snapshot.html.erb", "app/views/dialog/attach_volume.html.erb", "app/views/dialog/create_volume.html.erb", "app/views/dialog/launch_instance.html.erb", "app/views/dialog/reboot_instances.html.erb", "app/views/dialog/create_ssh_keypair.html.erb", "app/views/dialog/delete_volume.html.erb", "app/views/dialog/delete_security_group.html.erb", "app/views/home/index.html.erb", "app/views/instances/index.html.erb", "app/views/accounts/index.html.erb", "app/views/accounts/password.html.erb", "app/views/sessions/new.html.erb", "app/views/sessions/information.html.erb", "app/views/host_pools/index.html.erb", "app/views/machine_images/index.html.erb", "app/views/security_groups/index.html.erb", "app/views/volumes/index.html.erb", "app/views/layouts/_informationarea.html.erb", "app/views/layouts/_footer.html.erb", "app/views/layouts/_sidemenu.html.erb", "app/views/layouts/_login_header.erb", "app/views/layouts/login.html.erb", "app/views/layouts/_header.html.erb", "app/views/layouts/application.html.erb", "lib/cli/errors.rb", "lib/cli/account.rb", "lib/cli/base.rb", "lib/cli/user.rb", "config/cli_token.rb", "config/application-cli.rb", "config/routes.rb", "config/environment-api.rb", "config/environment.rb", "config/boot.rb", "config/initializers/inflections.rb", "config/initializers/backtrace_silencers.rb", "config/initializers/sequel.rb", "config/initializers/mime_types.rb", "config/initializers/site.rb", "config/initializers/secret_token.rb", "config/initializers/session_store.rb", "config/initializers/dcmgr_gui.rb", "config/environment-auth.rb", "config/environments/development.rb", "config/environments/production.rb", "config/environments/test.rb", "config/application.rb", "config/environment-cli.rb", "config/locales/ja.yml", "config/locales/ja-JP.yml", "config/locales/en.yml", "config/database.yml", "config/dcmgr_gui.yml", "db/migrations/0001_origin.rb", "db/seeds.rb", "extras/util.rb", "extras/authentication.rb", "public/robots.txt", "public/stylesheets/jquery.loadmask.css", "public/stylesheets/reset.css", "public/stylesheets/vtip.css", "public/stylesheets/sexyalertbox.css", "public/stylesheets/dialog.css", "public/stylesheets/style.css", "public/stylesheets/jquery.cluetip.css", "public/stylesheets/jquery-ui-1.8.4.custom.css", "public/stylesheets/common.css", "public/stylesheets/ui.selectmenu.css", "public/stylesheets/BreadCrumb.css", "public/404.html", "public/javascripts/prototype.js", "public/javascripts/jquery-ui-1.8.4.custom.min.js", "public/javascripts/jquery.jBreadCrumb.1.1.js", "public/javascripts/jquery.cluetip.min.js", "public/javascripts/jquery-1.4.2.min.js", "public/javascripts/sexyalertbox.v1.2.jquery.js", "public/javascripts/jsdeferred.jquery.js", "public/javascripts/rails.js", "public/javascripts/jquery.tmpl.js", "public/javascripts/jquery.loadmask.min.js", "public/javascripts/controls.js", "public/javascripts/jquery.easing.1.3.js", "public/javascripts/effects.js", "public/javascripts/dragdrop.js", "public/javascripts/jquery.hoverIntent.js", "public/javascripts/dcmgr_gui/instance_panel.js", "public/javascripts/dcmgr_gui/dashboard_panel.js", "public/javascripts/dcmgr_gui/storage_pool_panel.js", "public/javascripts/dcmgr_gui/application.js", "public/javascripts/dcmgr_gui/snapshot_panel.js", "public/javascripts/dcmgr_gui/core.js", "public/javascripts/dcmgr_gui/sshkeypair_panel.js", "public/javascripts/dcmgr_gui/host_pool_panel.js", "public/javascripts/dcmgr_gui/account_panel.js", "public/javascripts/dcmgr_gui/volume_panel.js", "public/javascripts/dcmgr_gui/security_group_panel.js", "public/javascripts/dcmgr_gui/image_panel.js", "public/javascripts/jquery.i18n.properties-min.js", "public/javascripts/ui.selectmenu.js", "public/i18n/Messages_ja.properties", "public/i18n/Messages_en.properties", "public/i18n/Messages_ja-JP.properties", "public/i18n/Messages.properties", "public/favicon.ico", "public/422.html", "public/images/ui-icons_ffffff_256x240.png", "public/images/IconHome.gif", "public/images/icon_ttl_personal_inf.gif", "public/images/mainarea_wide_content_bg.gif", "public/images/mainarea_content_bg.gif", "public/images/loader_boxes.gif", "public/images/ui-icons_ef8c08_256x240.png", "public/images/loading.gif", "public/images/infra_passive.gif", "public/images/body_bg.gif", "public/images/btn_hide.gif", "public/images/btn_create_snapshot.gif", "public/images/ui-bg_highlight-soft_50_136d76_1x100.png", "public/images/ui-bg_glass_10_458845_1x400.png", "public/images/icon_security.gif", "public/images/content_foot_bg.gif", "public/images/bg-box-top.png", "public/images/ui-bg_diagonals-thick_18_b81900_40x40.png", "public/images/menu_list_header.gif", "public/images/ui-bg_glass_100_f6f6f6_1x400.png", "public/images/btn_prev.gif", "public/images/ui-bg_glass_100_fdf5ce_1x400.png", "public/images/sidemenu_bg.gif", "public/images/clear.gif", "public/images/bg-box-bottom.png", "public/images/loader_ball.gif", "public/images/cluetip/tr.gif", "public/images/cluetip/rarrowright.gif", "public/images/cluetip/arrowdown.gif", "public/images/cluetip/bl.png", "public/images/cluetip/arrowup.gif", "public/images/cluetip/arrowleft.gif", "public/images/cluetip/rarrowleft.gif", "public/images/cluetip/br.png", "public/images/cluetip/br.gif", "public/images/cluetip/itunes.png", "public/images/cluetip/tr.png", "public/images/cluetip/wait.gif", "public/images/cluetip/darrowright.gif", "public/images/cluetip/darrowleft.gif", "public/images/cluetip/rarrowdown.gif", "public/images/cluetip/tl.gif", "public/images/cluetip/darrowup.gif", "public/images/cluetip/arrowright.gif", "public/images/cluetip/darrowdown.gif", "public/images/cluetip/tl.png", "public/images/cluetip/rarrowup.gif", "public/images/cluetip/bl.gif", "public/images/footer_bg.gif", "public/images/icon_images.gif", "public/images/ui-bg_flat_55_fcf0ba_40x100.png", "public/images/btn_create_volume.gif", "public/images/lastelement_bg.gif", "public/images/btn_launch.gif", "public/images/dialog-error.png", "public/images/btn_next.gif", "public/images/btn_show_accesskey.png", "public/images/sidemenu_bottom.gif", "public/images/ui-bg_highlight-soft_95_ffedad_1x100.png", "public/images/listicon_useast.gif", "public/images/icon_resource04.gif", "public/images/content_head_bg.gif", "public/images/icon_caution.gif", "public/images/ui-icons_222222_256x240.png", "public/images/ui-icons_cd0a0a_256x240.png", "public/images/ui-bg_diagonals-thick_20_666666_40x40.png", "public/images/menu_list_header_current.gif", "public/images/mainarea_wide_bottom_bg.gif", "public/images/sidemenu_top.gif", "public/images/ui-bg_glass_55_fcf0ba_1x400.png", "public/images/ui-icons_228ef1_256x240.png", "public/images/btn_delete_security_group.gif", "public/images/ui-bg_highlight-hard_100_f5f3e5_1x100.png", "public/images/mainarea_wide_h3_bg.gif", "public/images/bg-box-top.gif", "public/images/btn_delete_snapshot.gif", "public/images/btn_delete_volume.gif", "public/images/app_active.gif", "public/images/mainarea_h3_bg.gif", "public/images/regionselect_bg.gif", "public/images/bup_btn_healthdetail.gif", "public/images/ui-icons_eeeeee_256x240.png", "public/images/icon_summary.gif", "public/images/dialog-help.png", "public/images/ui-bg_glass_10_136d76_1x400.png", "public/images/ui-icons_808080_256x240.png", "public/images/Chevron.gif", "public/images/plat_passive.gif", "public/images/bup_btn_refresh.gif", "public/images/btn_createkey.gif", "public/images/ui-bg_glass_65_ffffff_1x400.png", "public/images/icon_blockstore.gif", "public/images/icon_health.gif", "public/images/ChevronOverlay.png", "public/images/content_bg.png", "public/images/ui-bg_flat_10_000000_40x100.png", "public/images/btn_refresh.gif", "public/images/select_bg_126.gif", "public/images/app_passive.gif", "public/images/icon_resource03.gif", "public/images/dialog-information.png", "public/images/btn_deletekey.gif", "public/images/ui-bg_inset-soft_15_386b3d_1x100.png", "public/images/infra_active.gif", "public/images/ui-bg_highlight-hard_15_459e00_1x100.png", "public/images/icon_ttl_accskey.gif", "public/images/icon_information.gif", "public/images/header_logo.gif", "public/images/ui-bg_highlight-soft_100_eeeeee_1x100.png", "public/images/btn_show.gif", "public/images/bg-box-body.png", "public/images/btn_de_register.gif", "public/images/btn_create_security_group.gif", "public/images/icon_service.gif", "public/images/ui-bg_gloss-wave_35_f6a828_500x100.png", "public/images/mainarea_bottom_bg.gif", "public/images/btn_savechange.gif", "public/images/icon_ttl_detail.gif", "public/images/ui-bg_highlight-soft_75_ffe45c_1x100.png", "public/images/ui-bg_highlight-hard_100_fafaf4_1x100.png", "public/images/ui-icons_4c9052_256x240.png", "public/images/btn_change.gif", "public/images/icon_ttl_instance.gif", "public/images/head_gradation_bg.gif", "public/images/dialog-warning.png", "public/images/icon_stop.gif", "public/images/ui-bg_gloss-wave_100_ece8da_500x100.png", "public/images/btn_healthdetail.gif", "public/images/icon_service_stat.gif", "public/images/bg-box-body.gif", "public/images/ui-icons_8dc262_256x240.png", "public/images/icon_resource02.gif", "public/images/vtip_arrow.png", "public/images/select_bg_139.gif", "public/images/icon_instances.gif", "public/images/ui-icons_847e71_256x240.png", "public/images/icon_resource.gif", "public/images/icon_rss.gif", "public/images/ui-bg_inset-soft_15_2b2922_1x100.png", "public/images/ui-bg_highlight-hard_95_cccccc_1x100.png", "public/images/bg-box-bottom.gif", "public/images/ui-bg_highlight-soft_25_67b021_1x100.png", "public/images/icon_resource01.gif", "public/images/lastelement_bg.png", "public/images/ui-icons_ffd27a_256x240.png", "public/images/plat_active.gif", "public/images/btn_register_new_ami.gif", "public/500.html", "lib/tasks/dcmgr_api.rake", "lib/tasks/dcmgr_oauth.rake", "lib/tasks/dcmgr_gui.rake", "test/functional/information_controller_test.rb", "test/functional/sessions_controller_test.rb", "test/functional/security_groups_controller_test.rb", "test/functional/storage_pools_controller_test.rb", "test/functional/users_controller_test.rb", "test/functional/dialog_controller_test.rb", "test/functional/instances_controller_test.rb", "test/functional/host_pools_controller_test.rb", "test/functional/snapshots_controller_test.rb", "test/functional/volumes_controller_test.rb", "test/functional/keypairs_controller_test.rb", "test/functional/home_controller_test.rb", "test/functional/accounts_controller_test.rb", "test/functional/machine_images_controller_test.rb", "test/performance/browsing_test.rb", "test/test_helper.rb", "test/unit/helpers/security_groups_helper_test.rb", "test/unit/helpers/machine_images_helper_test.rb", "test/unit/helpers/information_helper_test.rb", "test/unit/helpers/snapshots_helper_test.rb", "test/unit/helpers/home_helper_test.rb", "test/unit/helpers/sessions_helper_test.rb", "test/unit/helpers/volumes_helper_test.rb", "test/unit/helpers/keypairs_helper_test.rb", "test/unit/helpers/users_helper_test.rb", "test/unit/helpers/dialog_helper_test.rb", "test/unit/helpers/host_pools_helper_test.rb", "test/unit/helpers/instances_helper_test.rb", "test/unit/helpers/accounts_helper_test.rb", "test/unit/helpers/storage_pools_helper_test.rb", "tmp/", "script/rails", "Rakefile", "config.ru", "LICENSE", "NOTICE", "INSTALL.txt", "INSTALL-API.txt", "tmp"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = "1.8.10"
  s.summary = "Wakame-VDC: UI frontend"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["= 3.0.11"])
      s.add_runtime_dependency(%q<mysql>, ["= 2.8.1"])
      s.add_runtime_dependency(%q<sequel>, ["= 3.27.0"])
      s.add_runtime_dependency(%q<json>, ["= 1.6.3"])
      s.add_runtime_dependency(%q<oauth>, ["= 0.4.1"])
      s.add_runtime_dependency(%q<nokogiri>, ["= 1.4.4"])
      s.add_runtime_dependency(%q<thor>, ["= 0.14.6"])
    else
      s.add_dependency(%q<rails>, ["= 3.0.11"])
      s.add_dependency(%q<mysql>, ["= 2.8.1"])
      s.add_dependency(%q<sequel>, ["= 3.27.0"])
      s.add_dependency(%q<json>, ["= 1.6.3"])
      s.add_dependency(%q<oauth>, ["= 0.4.1"])
      s.add_dependency(%q<nokogiri>, ["= 1.4.4"])
      s.add_dependency(%q<thor>, ["= 0.14.6"])
    end
  else
    s.add_dependency(%q<rails>, ["= 3.0.11"])
    s.add_dependency(%q<mysql>, ["= 2.8.1"])
    s.add_dependency(%q<sequel>, ["= 3.27.0"])
    s.add_dependency(%q<json>, ["= 1.6.3"])
    s.add_dependency(%q<oauth>, ["= 0.4.1"])
    s.add_dependency(%q<nokogiri>, ["= 1.4.4"])
    s.add_dependency(%q<thor>, ["= 0.14.6"])
  end
end
