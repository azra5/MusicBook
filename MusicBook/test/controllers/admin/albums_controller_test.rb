require 'test_helper'

class Admin::AlbumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_album = admin_albums(:one)
  end

  test "should get index" do
    get admin_albums_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_album_url
    assert_response :success
  end

  test "should create admin_album" do
    assert_difference('Admin::Album.count') do
      post admin_albums_url, params: { admin_album: { artist_id: @admin_album.artist_id, name: @admin_album.name, year: @admin_album.year } }
    end

    assert_redirected_to admin_album_url(Admin::Album.last)
  end

  test "should show admin_album" do
    get admin_album_url(@admin_album)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_album_url(@admin_album)
    assert_response :success
  end

  test "should update admin_album" do
    patch admin_album_url(@admin_album), params: { admin_album: { artist_id: @admin_album.artist_id, name: @admin_album.name, year: @admin_album.year } }
    assert_redirected_to admin_album_url(@admin_album)
  end

  test "should destroy admin_album" do
    assert_difference('Admin::Album.count', -1) do
      delete admin_album_url(@admin_album)
    end

    assert_redirected_to admin_albums_url
  end
end
