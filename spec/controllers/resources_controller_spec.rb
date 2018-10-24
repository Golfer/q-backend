describe ResourcesController, type: :controller do
  describe '#index' do
    before(:each) { get :index }
    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template :index }
  end

  #
  # let(:valid_attributes) {
  #   skip("Add a hash of attributes valid for your model")
  # }
  #
  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }
  #
  # # This should return the minimal set of values that should be in the session
  # # in order to pass any filters (e.g. authentication) defined in
  # # ResourcesController. Be sure to keep this updated too.
  # let(:valid_session) { {} }
  #
  # describe "GET #index" do
  #   it "returns a success response" do
  #     DataQuotation.create! valid_attributes
  #     get :index, params: {}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "GET #show" do
  #   it "returns a success response" do
  #     resource = DataQuotation.create! valid_attributes
  #     get :show, params: {id: resource.to_param}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "returns a success response" do
  #     get :new, params: {}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "returns a success response" do
  #     resource = DataQuotation.create! valid_attributes
  #     get :edit, params: {id: resource.to_param}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new Resource" do
  #       expect {
  #         post :create, params: {resource: valid_attributes}, session: valid_session
  #       }.to change(DataQuotation, :count).by(1)
  #     end
  #
  #     it "redirects to the created resource" do
  #       post :create, params: {resource: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(DataQuotation.last)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'new' template)" do
  #       post :create, params: {resource: invalid_attributes}, session: valid_session
  #       expect(response).to be_successful
  #     end
  #   end
  # end
  #
  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested resource" do
  #       resource = DataQuotation.create! valid_attributes
  #       put :update, params: {id: resource.to_param, resource: new_attributes}, session: valid_session
  #       resource.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "redirects to the resource" do
  #       resource = DataQuotation.create! valid_attributes
  #       put :update, params: {id: resource.to_param, resource: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(resource)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'edit' template)" do
  #       resource = DataQuotation.create! valid_attributes
  #       put :update, params: {id: resource.to_param, resource: invalid_attributes}, session: valid_session
  #       expect(response).to be_successful
  #     end
  #   end
  # end
  #
  # describe "DELETE #destroy" do
  #   it "destroys the requested resource" do
  #     resource = DataQuotation.create! valid_attributes
  #     expect {
  #       delete :destroy, params: {id: resource.to_param}, session: valid_session
  #     }.to change(DataQuotation, :count).by(-1)
  #   end
  #
  #   it "redirects to the resources list" do
  #     resource = DataQuotation.create! valid_attributes
  #     delete :destroy, params: {id: resource.to_param}, session: valid_session
  #     expect(response).to redirect_to(resources_url)
  #   end
  # end
end
