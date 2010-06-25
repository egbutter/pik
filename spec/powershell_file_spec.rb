
describe Pik::PowershellFile do

  before do
    @bf = Pik::PowershellFile.new('pik')
  end

	it "should have the correct file name" do
		@bf.path.to_s.should == 'pik.ps1'

    bf2 = Pik::PowershellFile.new('pik.ps1')
    bf2.path.to_s.should == 'pik.ps1'
	end

	it "should have a header" do
		string =  "#  This powshell script generated by Pik, the\n#  Ruby Manager for Windows\n"
		@bf.to_s.should == string	
	end

  it "should generate a path command with the updated ruby path" do
		@bf.set('PATH' => Pathname("C:\\ruby\\191\\bin")).to_s.should match(/\$ENV:PATH\=\"C:\\ruby\\191\\bin\"/)
    @bf.set('GEM_HOME' => nil).to_s.should match(/Remove\-Item ENV\:GEM_HOME/)
	end

  it "should echo a string given" do 
    @bf.echo("Hello World").to_s.should match(/ECHO Hello World/)
  end

  it "should call the command given" do 
    @bf.call('pik.bat').to_s.should match(/pik\.bat/)
  end
	
end