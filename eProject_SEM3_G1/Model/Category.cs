using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using eProject_SEM3_G1.Model.DataAccess;

namespace eProject_SEM3_G1.Model
{
    public class Category
    {
        private int categoryId;

        public int CategoryId
        {
            get { return categoryId; }
            set { categoryId = value; }
        }
        private string categoryName;

        public string CategoryName
        {
            get { return categoryName; }
            set { categoryName = value; }
        }
        private List<Category> childrenCategory;

        public List<Category> ChildrenCategory
        {
            get 
            {
                if (childrenCategory == null) childrenCategory = new List<Category>();
                return childrenCategory; 
            }
            set { childrenCategory = value; }
        }


        public override string ToString()
        {
            return this.categoryName;
        }

        public override bool Equals(object obj)
        {
            return this.GetHashCode() == obj.GetHashCode();
        }

        public override int GetHashCode()
        {
            return this.CategoryId.GetHashCode();
        }

        public static List<Category> GetAllCategory()
        {
            return CategoryDAO.GetAllCategory();
        }
    }

    public class CategoryComparer: IEqualityComparer<Category>
    {
        public bool Equals(Category objectOne, Category objectTwo)
        {
            return ((objectOne.CategoryId == objectTwo.CategoryId) && (objectOne.CategoryName.Equals(objectTwo.CategoryName)));
        }

        public int GetHashCode(Category objCate)
        {
            return objCate.CategoryId.GetHashCode();
        }
    }
}