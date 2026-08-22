#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

RSpec.describe "Kitchen::Driver::HYPERV_VERSION" do
  subject(:version) { Kitchen::Driver::HYPERV_VERSION }

  it "is a semantic version string" do
    expect(version).to match(/\A\d+\.\d+\.\d+(\.[\w.]+)?\z/)
  end

  it "is frozen, so nothing can mutate the published version at runtime" do
    expect(version).to be_frozen
  end

  it "is a version RubyGems will accept" do
    expect { Gem::Version.new(version) }.not_to raise_error
  end

  it "is the version the built gem will carry" do
    gemspec = Gem::Specification.load(File.expand_path("../../../kitchen-hyperv.gemspec", __dir__))

    expect(gemspec.version.to_s).to eq(version)
  end

  it "matches the version release-please tracks" do
    manifest = JSON.parse(File.read(File.expand_path("../../../.release-please-manifest.json", __dir__)))

    expect(manifest.values).to include(version)
  end
end
