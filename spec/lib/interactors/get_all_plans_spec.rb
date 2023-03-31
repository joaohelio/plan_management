require '/app/lib/interactors/get_all_plans'

RSpec.describe PlanManagement::Interactors::GetAllPlans do
  let(:plan_repo) { double('plan_repo') }
  subject { described_class.new(plan_repo: plan_repo) }

  describe '#execute' do
    it 'returns all plans from the plan repository' do
      plans = [double('plan'), double('plan')]
      allow(plan_repo).to receive(:all).and_return(plans)

      result = subject.execute

      expect(result).to eq(plans)
    end
  end
end
