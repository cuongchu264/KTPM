using System.Collections;
using System.Collections.Generic;

namespace BMSTest.TestController
{
    public class TestLoginInputData : IEnumerable<object[]>
    {
        private readonly List<object[]> data = new List<object[]>()
        {
            new object[]
            {
                "",
                "cnd21123"
            },
            new object[]
            {
                "congdat123",
                ""
            },
            new object[]
            {
                "congdat214",
                "cnd211d23"
            },
            new object[]
            {
                "congdat123",
                "cnd210601"
            },
            new object[]
            {
                "congdat1243",
                "cnd2112312"
            },
            new object[]
            {
                "congdat321",
                "cnd211323"
            },
            new object[]
            {
                "cong2dat21",
                "cnd2112323"
            },
            new object[]
            {
                "congda2t1",
                "cnd211223"
            },
            new object[]
            {
                "co2ngdat21",
                "cnd222123"
            },
            new object[]
            {
                "co2n2gdat1",
                "cn2d221123"
            },
        };

        public IEnumerator<object[]> GetEnumerator()
        {
            return this.data.GetEnumerator();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return this.GetEnumerator();
        }
    }
}
