﻿// ------------------------------------------------------------------------------
//  <auto-generated>
//      This code was generated by SpecFlow (https://www.specflow.org/).
//      SpecFlow Version:3.9.0.0
//      SpecFlow Generator Version:3.9.0.0
// 
//      Changes to this file may cause incorrect behavior and will be lost if
//      the code is regenerated.
//  </auto-generated>
// ------------------------------------------------------------------------------
#region Designer generated code
#pragma warning disable
namespace Library.Tests.Specs.Features
{
    using TechTalk.SpecFlow;
    using System;
    using System.Linq;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("TechTalk.SpecFlow", "3.9.0.0")]
    [System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [Xunit.CollectionAttribute("SpecFlowNonParallelizableFeatures")]
    [Xunit.TraitAttribute("Category", "NonParallelizableFeature")]
    public partial class MovieFeature : object, Xunit.IClassFixture<MovieFeature.FixtureData>, System.IDisposable
    {
        
        private static TechTalk.SpecFlow.ITestRunner testRunner;
        
        private string[] _featureTags = new string[] {
                "NonParallelizableFeature"};
        
        private Xunit.Abstractions.ITestOutputHelper _testOutputHelper;
        
        public MovieFeature(MovieFeature.FixtureData fixtureData, Library_Tests_Specs_XUnitAssemblyFixture assemblyFixture, Xunit.Abstractions.ITestOutputHelper testOutputHelper)
        {
            this._testOutputHelper = testOutputHelper;
            this.TestInitialize();
        }
        
        public static void FeatureSetup()
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner();
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "Features", "Movie", null, ProgrammingLanguage.CSharp, new string[] {
                        "NonParallelizableFeature"});
            testRunner.OnFeatureStart(featureInfo);
        }
        
        public static void FeatureTearDown()
        {
            testRunner.OnFeatureEnd();
            testRunner = null;
        }
        
        public virtual void TestInitialize()
        {
        }
        
        public virtual void TestTearDown()
        {
            testRunner.OnScenarioEnd();
        }
        
        public virtual void ScenarioInitialize(TechTalk.SpecFlow.ScenarioInfo scenarioInfo)
        {
            testRunner.OnScenarioInitialize(scenarioInfo);
            testRunner.ScenarioContext.ScenarioContainer.RegisterInstanceAs<Xunit.Abstractions.ITestOutputHelper>(_testOutputHelper);
        }
        
        public virtual void ScenarioStart()
        {
            testRunner.OnScenarioStart();
        }
        
        public virtual void ScenarioCleanup()
        {
            testRunner.CollectScenarioErrors();
        }
        
        public virtual void FeatureBackground()
        {
            TechTalk.SpecFlow.Table table6 = new TechTalk.SpecFlow.Table(new string[] {
                        "Label",
                        "ReleaseDate",
                        "Support",
                        "ImageURL",
                        "Director",
                        "Editor"});
            table6.AddRow(new string[] {
                        "Label1",
                        "16/10/1999",
                        "support",
                        "ImageURL",
                        "director",
                        "editor"});
            table6.AddRow(new string[] {
                        "Label2",
                        "16/10/2000",
                        "support",
                        "ImageURL",
                        "director",
                        "editor"});
            testRunner.Given("the movies are", ((string)(null)), table6, "Given ");
        }
        
        void System.IDisposable.Dispose()
        {
            this.TestTearDown();
        }
        
        [Xunit.SkippableFactAttribute(DisplayName="Create Movie")]
        [Xunit.TraitAttribute("FeatureTitle", "Movie")]
        [Xunit.TraitAttribute("Description", "Create Movie")]
        [Xunit.TraitAttribute("Category", "add-videogames-to-collection")]
        public virtual void CreateMovie()
        {
            string[] tagsOfScenario = new string[] {
                    "add-videogames-to-collection"};
            System.Collections.Specialized.OrderedDictionary argumentsOfScenario = new System.Collections.Specialized.OrderedDictionary();
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("Create Movie", null, tagsOfScenario, argumentsOfScenario, this._featureTags);
            this.ScenarioInitialize(scenarioInfo);
            bool isScenarioIgnored = default(bool);
            bool isFeatureIgnored = default(bool);
            if ((tagsOfScenario != null))
            {
                isScenarioIgnored = tagsOfScenario.Where(__entry => __entry != null).Where(__entry => String.Equals(__entry, "ignore", StringComparison.CurrentCultureIgnoreCase)).Any();
            }
            if ((this._featureTags != null))
            {
                isFeatureIgnored = this._featureTags.Where(__entry => __entry != null).Where(__entry => String.Equals(__entry, "ignore", StringComparison.CurrentCultureIgnoreCase)).Any();
            }
            if ((isScenarioIgnored || isFeatureIgnored))
            {
                testRunner.SkipScenario();
            }
            else
            {
                this.ScenarioStart();
                this.FeatureBackground();
                TechTalk.SpecFlow.Table table7 = new TechTalk.SpecFlow.Table(new string[] {
                            "Label",
                            "ReleaseDate",
                            "Support",
                            "ImageURL",
                            "Director",
                            "Editor"});
                table7.AddRow(new string[] {
                            "Label3",
                            "16/10/2001",
                            "support2",
                            "ImageURL",
                            "director",
                            "editor"});
                testRunner.When("add a movie", ((string)(null)), table7, "When ");
                TechTalk.SpecFlow.Table table8 = new TechTalk.SpecFlow.Table(new string[] {
                            "Label",
                            "ReleaseDate",
                            "Support",
                            "ImageURL",
                            "Director",
                            "Editor"});
                table8.AddRow(new string[] {
                            "Label1",
                            "16/10/1999",
                            "support",
                            "ImageURL",
                            "director",
                            "editor"});
                table8.AddRow(new string[] {
                            "Label2",
                            "16/10/2000",
                            "support",
                            "ImageURL",
                            "director",
                            "editor"});
                table8.AddRow(new string[] {
                            "Label3",
                            "16/10/2001",
                            "support2",
                            "ImageURL",
                            "director",
                            "editor"});
                testRunner.Then("the movies should be", ((string)(null)), table8, "Then ");
            }
            this.ScenarioCleanup();
        }
        
        [System.CodeDom.Compiler.GeneratedCodeAttribute("TechTalk.SpecFlow", "3.9.0.0")]
        [System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
        public class FixtureData : System.IDisposable
        {
            
            public FixtureData()
            {
                MovieFeature.FeatureSetup();
            }
            
            void System.IDisposable.Dispose()
            {
                MovieFeature.FeatureTearDown();
            }
        }
    }
}
#pragma warning restore
#endregion
