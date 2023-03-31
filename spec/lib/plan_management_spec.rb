require '/app/lib/plan_management'

RSpec.describe PlanManagement do
  let(:plan_repo) { double('plan_repo') }

  before do
    allow(described_class).to receive(:plan_repo).and_return(plan_repo)
  end

  describe '.find' do
    let(:find_interactor) { double('find_interactor') }
    let(:id) { 1 }

    it 'calls the FindPlan interactor with the correct arguments' do
      expect(PlanManagement::Interactors::FindPlan).to receive(:new).with(plan_repo: plan_repo).and_return(find_interactor)
      expect(find_interactor).to receive(:execute).with(id)

      PlanManagement.find(id)
    end
  end

  describe '.all' do
    let(:get_all_interactor) { double('get_all_interactor') }

    it 'calls the GetAllPlans interactor with the correct arguments' do
      expect(PlanManagement::Interactors::GetAllPlans).to receive(:new).with(plan_repo: plan_repo).and_return(get_all_interactor)
      expect(get_all_interactor).to receive(:execute)

      PlanManagement.all
    end
  end

  describe '.create' do
    let(:create_interactor) { double('create_interactor') }
    let(:params) { { name: 'New Plan', price: 10 } }

    it 'calls the CreatePlan interactor with the correct arguments' do
      expect(PlanManagement::Interactors::CreatePlan).to receive(:new).with(plan_repo: plan_repo).and_return(create_interactor)
      expect(create_interactor).to receive(:execute).with(params)

      PlanManagement.create(params)
    end
  end

  describe '.update' do
    let(:update_interactor) { double('update_interactor') }
    let(:id) { 1 }
    let(:params) { { name: 'Updated Plan', price: 20 } }

    it 'calls the UpdatePlan interactor with the correct arguments' do
      expect(PlanManagement::Interactors::UpdatePlan).to receive(:new).with(plan_repo: plan_repo).and_return(update_interactor)
      expect(update_interactor).to receive(:execute).with(id: id, params: params)

      PlanManagement.update(id: id, params: params)
    end
  end
end
