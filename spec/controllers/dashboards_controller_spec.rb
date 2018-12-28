describe DashboardsController, type: :controller do
  describe '#index' do
    before(:each) { get :index }
    xit { expect(response).to have_http_status(:success) }
    xit { expect(response).to render_template :index }
  end
end
