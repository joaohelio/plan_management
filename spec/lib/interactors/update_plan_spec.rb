require '/app/lib/interactors/update_plan'

RSpec.describe PlanManagement::Interactors::UpdatePlan do
  let(:plan_repo) { double('plan_repo') }
  subject { described_class.new(plan_repo: plan_repo) }

  describe '#execute' do
    it 'updates the plan with the given ID and params' do
      id = 1
      params = { name: 'Updated Plan', price: 10 }
      plan = double('plan', id: id)

      expect(plan_repo).to receive(:update).with(id: id, params: params).and_return(plan)

      result = subject.execute(id: id, params: params)

      expect(result).to eq(plan)
    end
  end
end
