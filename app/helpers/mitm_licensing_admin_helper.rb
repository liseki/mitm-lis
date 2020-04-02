module MitmLicensingAdminHelper

	def  tree_plus_or_minus(id)
		category = Category.find_by_id(id)
		category_tree_sign = category.children_count > 0 ? "tree_plus.gif" : "tree_minus.gif"
		return category_tree_sign
	end

end
