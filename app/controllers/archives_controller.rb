class ArchivesController
	def index
		@posts = Post.all
	end
end