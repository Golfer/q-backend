describe DashboardsController, type: :controller do
  describe '#index' do
    before(:each) { get :index }
    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template :index }
  end
end
