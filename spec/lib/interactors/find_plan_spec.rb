require '/app/lib/interactors/find_plan'

RSpec.describe PlanManagement::Interactors::FindPlan do
  let(:plan_repo) { double('plan_repo') }

  subject { described_class.new(plan_repo: plan_repo) }

  describe '#execute' do
    it 'finds the plan with the given id' do
      id = 1
      plan = { id: id, name: 'Test Plan', price: 10 }

      allow(plan_repo).to receive(:find).with(id).and_return(plan)

      expect(subject.execute(id)).to eq(plan)
    end
  end
end
