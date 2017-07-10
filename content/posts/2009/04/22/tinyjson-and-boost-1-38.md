extends: post.liquid

title: TinyJSON and boost 1.38
date: 22 Apr 2009 00:00:00 +0100
type: blog

categories: ["Programming", "C++"]
---

Today i compiled (link no longer available) TinyJSON on my Mac with boost 1.38. Because many of the used headers inside boost.Spirit have
been moved into new files and namespaces [Changelog](http://www.boost.org/doc/libs/1_38_0/libs/spirit/classic/change_log.html),
 you need to make some changes in tinyjson.hpp.

<!-- more -->

Here is a svn diff with the changes

```diff
Index: tinyjson.hpp
===================================================================
--- tinyjson.hpp    (revision 114)
+++ tinyjson.hpp    (working copy)
@@ -27,8 +27,8 @@

 #include   <boost/shared_ptr.hpp>
 #include   <boost/any.hpp>
-#include   <boost/spirit/core.hpp>
-#include   <boost/spirit/utility/loops.hpp>
+#include   <boost/spirit/include/classic_core.hpp>
+#include   <boost/spirit/include/classic_loops.hpp>
 #include   <boost/lexical_cast.hpp>

 #include   <string>
@@ -95,7 +95,7 @@
    // ==========================================================================================================

    template< typename Char >
-   class grammar : public boost::spirit::grammar< grammar< Char > >
+   class grammar : public boost::spirit::classic::grammar< grammar< Char > >
    {
    public:

@@ -435,24 +435,24 @@
        template <typename SCANNER>
        class definition
        {
-           boost::spirit::rule< SCANNER > m_object;
-           boost::spirit::rule< SCANNER > m_array;
-           boost::spirit::rule< SCANNER > m_pair;
-           boost::spirit::rule< SCANNER > m_value;
-           boost::spirit::rule< SCANNER > m_string;
-           boost::spirit::rule< SCANNER > m_number;
-           boost::spirit::rule< SCANNER > m_boolean;
-           boost::spirit::rule< SCANNER > m_null;
+           boost::spirit::classic::rule< SCANNER > m_object;
+           boost::spirit::classic::rule< SCANNER > m_array;
+           boost::spirit::classic::rule< SCANNER > m_pair;
+           boost::spirit::classic::rule< SCANNER > m_value;
+           boost::spirit::classic::rule< SCANNER > m_string;
+           boost::spirit::classic::rule< SCANNER > m_number;
+           boost::spirit::classic::rule< SCANNER > m_boolean;
+           boost::spirit::classic::rule< SCANNER > m_null;

        public:

-           boost::spirit::rule< SCANNER > const &amp; start() const { return m_object; }
+           boost::spirit::classic::rule< SCANNER > const &amp; start() const { return m_object; }

            // - -[ create the definition ] - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

            definition(grammar const &amp; self)
            {
-               using namespace boost::spirit;
+               using namespace boost::spirit::classic;

                // 1: an object is an unordered set of pairs (seperated by commas)...
@@ -546,10 +546,10 @@
    {
        // 1: parse the input...

-       json::grammar< typename Iterator::value_type >::stack st;
+       typename json::grammar< typename Iterator::value_type >::stack st;
        json::grammar< typename Iterator::value_type > gr(st);

-       boost::spirit::parse_info<Iterator> pi = boost::spirit::parse(szFirst, szEnd, gr, boost::spirit::space_p);
+       boost::spirit::classic::parse_info<Iterator> pi = boost::spirit::classic::parse(szFirst, szEnd, gr, boost::spirit::classic::space_p);

        // 2: skip any spaces at the end of the parsed section...

@@ -562,7 +562,7 @@

        if((pi.stop != szEnd) || (st.size() != 1))
        {
-           return json::grammar< typename Iterator::value_type >::variant(new boost::any());
+           return typename json::grammar< typename Iterator::value_type >::variant(new boost::any());
        }

        // 4: otherwise, return the result...
```
